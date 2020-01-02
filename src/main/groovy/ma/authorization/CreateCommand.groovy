package ma.authorization

import grails.validation.Validateable

class CreateCommand implements grails.validation.Validateable {
    Long person
    Long project
}
