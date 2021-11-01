package ma.agenda.domain

import groovy.transform.ToString

/**
 * @since 0.3.0
 */
@ToString(includes = ['fullName'])
class PersonEntity {
  Long id
  String fullName
}
