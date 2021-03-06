package ma

import ma.storage.Attachable

/**
 * Represents an authorization given by the person
 * in a given project
 *
 * @since 0.1.0
 */
class Authorization extends Auditable implements Dateable, Attachable {

    /**
     * An authorization belongs to a given person
     * but only for a given project
     *
     * @since 0.1.0
     */
    static belongsTo = [
      project: Project,
      person: Person
    ]

    /**
     * Validation constraints
     *
     * @since 0.1.0
     */
    static constraints = {
        description nullable: false, blank: false
        attachment nullable: false
        project nullable: true
    }

    static mapping = {
        table 'person_authorization'
    }
}
