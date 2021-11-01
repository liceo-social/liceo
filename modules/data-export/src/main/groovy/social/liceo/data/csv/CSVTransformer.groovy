package social.liceo.data.csv

/**
 * @since 0.2.0
 */
@FunctionalInterface
interface CSVTransformer<T> {
  Map<String, String> transform(T element)
}
