package ma.common.adapters.web.command

import grails.validation.Validateable
import groovy.transform.ToString

/**
 * Command used by controllers receiving pagination
 * parameters
 *
 * @since 0.3.0
 */
@ToString(includeNames = true)
class Pagination implements Validateable {

  Integer max
  Integer offset
  String order
  String sort

  Map asMap() {
    return [
      max: max,
      offset: offset,
      order: order,
      sort: sort
    ]
  }

  static constraints = {
    max nullable: true
    offset nullable: true
    order nullable: true
    sort nullable: true
  }
}
