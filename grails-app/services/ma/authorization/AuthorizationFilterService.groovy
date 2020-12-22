package ma.authorization

import ma.Authorization
import ma.Person
import ma.Project

/**
 * Filters documentation by project and person
 *
 * @since 0.3.0
 */
class AuthorizationFilterService {

  /**
   * Filters documents by project it belongs to and person is referring to
   *
   * @param project project the document belongs to
   * @param person person the document refers to
   * @param pagination pagination info
   * @return a paginated result of documents
   * @since 0.3.0
   */
  List<Authorization> filterByProjectAndPerson(Project project, Person person, Map pagination) {
    return Authorization.createCriteria().list(pagination) {
      if (project) {
        eq("project", project)
      }

      eq("person", person)
    }
  }
}
