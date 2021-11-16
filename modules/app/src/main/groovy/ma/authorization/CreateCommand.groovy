package ma.authorization

import grails.validation.Validateable

/**
 * A given authorization MUST be related to a given person and
 * it CAN be associated to a given project.
 *
 * @since 0.1.0
 */
class CreateCommand implements grails.validation.Validateable {

    /**
     * Person the authorization is tied to
     *
     * @since 0.1.0
     */
    Long person

    /**
     * An authorization can be associated with a given project
     *
     * @since 0.1.0
     */
    Long project

    /**
     * Validations to check when checking creation params
     *
     * @since 0.1.0
     */
    static constraints = {
        person nullable: false
        project nullable: true
    }
}
