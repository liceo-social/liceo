package ma

import ma.storage.Attachment

/**
 * Represents an authorization given by the person
 * in a given project
 *
 * @since 0.1.0
 */
class Authorization implements Auditable {

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
     * Describes the content of the authorization
     *
     * @since 0.1.0
     */
    String description

    /**
     * File containing the authorization
     *
     * @since 0.1.0
     */
    Attachment attachment

    /**
     * Validation constraints
     *
     * @since 0.1.0
     */
    static constraints = {
        description nullable: false, blank: false
        attachment nullable: false
    }
}
