package ma.authorization

import grails.validation.Validateable

import ma.Person
import ma.Authorization
import ma.storage.Attachment

class UpdateCommand implements Validateable {

    String description
    Attachment attachment
    Authorization authorization

    static constraints = {
        description nullable: false, blank: false
        attachment nullable: true
        authorization nullable: false
    }
}
