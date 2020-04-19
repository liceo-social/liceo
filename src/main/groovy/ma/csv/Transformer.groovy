package ma.csv

/**
 * Transforms an element of type <T> to a Map. The map's keys
 * will be used as the CSV header
 *
 * @since 0.2.0
 */
@FunctionalInterface
interface Transformer<T> {

  /**
   * Transforms an element of type T to a CSV line
   *
   * @param element each element to be converted to a CSV line
   * @return a {@link Map} representing a CSV line
   * @since 0.2.0
   */
  Map<String, String> transform(T element)
}
