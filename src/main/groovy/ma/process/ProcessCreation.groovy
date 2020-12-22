package ma.process

import grails.validation.Validateable

class ProcessCreation implements Validateable {
    Long person
    Long project

  static constraints = {
    project nullable: true
  }
}
