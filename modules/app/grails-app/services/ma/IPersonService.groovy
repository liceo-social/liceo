package ma

import ma.person.SearchCommand


interface IPersonService {

  Person get(Serializable id)

  List<Person> list(Map args)

  Long count()

  void delete(Serializable id)

  Person save(Person person)

  /**
   * Searches people using the given criteria command
   *
   * @param command the criteria to search people
   * @return a list with the result
   * @since 0.2.0
   */
  List<Person> search(SearchCommand command)

  /**
   * Creates a CSV file with the search result
   *
   * @param command the criteria
   * @return the exported result file
   * @since 0.2.0
   */
  File createSearchResultFile(SearchCommand command)

  /**
   * Marks the user as inactive
   *
   * @param person person to mark as inactive
   * @param motivation reason why the records is marked as inactive
   * @since 0.2.0
   */
  void disable(Person person, String motivation)


  /**
   * Activates a disabled person's record
   *
   * @param person the instance to activate
   * @since 0.2.0
   */
  void enable(Person person)
}
