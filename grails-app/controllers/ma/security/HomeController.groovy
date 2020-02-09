package ma.security

import grails.plugin.springsecurity.SpringSecurityService
import ma.Person

/**
 *
 * @since 0.1.0
 */
class HomeController {

    SpringSecurityService springSecurityService

    def index() {
        def currentUser = springSecurityService.currentUser
        def latestPeople = Person.findAllByProfessionalReference(
            currentUser,
            [
                max: 8,
                sort: 'lastUpdated',
                order: 'desc'
            ]
        )

        return [
            latestPeople: latestPeople
        ]
    }
}
