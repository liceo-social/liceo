package ma.agenda.domain

import groovy.transform.ToString

/**
 * @since 0.3.0
 */
@ToString(includes = ['name'])
class ProjectEntity {
  Long id
  String name
}
