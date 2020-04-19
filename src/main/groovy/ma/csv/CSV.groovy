package ma.csv

/**
 * Handles CSV files
 *
 * @since 0.2.0
 */
class CSV {

  /**
   * Creates a new writer to write a new CSV file the information from the iterable
   * passed as argument
   *
   * @param from an {@link Iterable} containing the CSV data lines
   * @param transformer a transformer converting each item in Iterable to a map
   * representing each line of the CSV
   * @return an instance of {@link CSVWriter}
   * @since 0.1.0
   */
  static <T> CSVWriter<T> from(Iterable<T> from, @DelegatesTo(value = Transformer, genericTypeIndex = 0) Closure<Map<String, ?>> transformer) {
    return new CSVWriter<T>(from, transformer)
  }
}
