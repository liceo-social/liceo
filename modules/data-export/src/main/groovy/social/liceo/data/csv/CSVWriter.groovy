package social.liceo.data.csv

import groovy.transform.builder.Builder

/**
 * Writes to a CSV file
 *
 * @since 0.2.0
 */
@Builder
class CSVWriter<T> {
  Iterable<T> lines
  Iterable<String> headerNames
  CSVTransformer<T> transformer

  void writeTo(Writer writer) {
    writer.withWriter { Writer to ->
      String headers = extractHeadersFromFirstEntry()
      to.println(headers)

      CSVTransformer<T> resolvedTransformer = resolveTransformer()
      lines.each { T element ->
        Map<String,String> transformedValue = resolvedTransformer.transform(element)
        String line = transformedValue
          .findAll { headers.contains(it.key) }
          .values()
          .collect { nv(it) }
          .collect { removeCommonSeparatorsFromValue(it) }
          .join(SEPARATOR)

        to.println(line)
      }
    }
  }

  private CSVTransformer<T> resolveTransformer() {
    if (transformer) {
      return transformer
    }

    return {
      it.properties.findAll {it.key.toString() != 'class' }
    } as CSVTransformer<T>
  }

  private static final String SEPARATOR = "|"

  private static String nv(Object possibleValue) {
    return possibleValue?.toString() ?: ""
  }

  private static String removeCommonSeparatorsFromValue(String possibleValue) {
    return possibleValue.replaceAll("\\${SEPARATOR}|,", "")
  }

  private String extractHeadersFromFirstEntry() {
    Map<String,?> headersMap = transformer.transform(lines.first())
    List<String> allHeaders = headersMap.keySet().toList()

    return allHeaders.intersect(this.headerNames ?: allHeaders).join(SEPARATOR)
  }
}
