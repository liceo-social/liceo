package ma.csv

import groovy.transform.TupleConstructor

/**
 * Writers to a csv file
 *
 * @since 0.2.0
 */
@TupleConstructor
class CSVWriter<T> {

  Iterable<T> iterable
  Transformer<T> transformer

  /**
   * Sets the output writer to write the csv data to
   *
   * @param writer writer to write csv information to
   * @since 0.2.0
   */
  void writeTo(Writer writer) {
    writer.withWriter { Writer to ->
      Map<String,?> headersMap = transformer.transform(iterable.first())
      String headers = headersMap.keySet().join(',')

      to.println(headers)

      iterable.each { T element ->
        String line = transformer
          .transform(element)
          .values()
          .join(",")

        to.println(line)
      }
    }
  }
}
