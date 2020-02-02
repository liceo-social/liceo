package ma

import grails.databinding.BindingFormat

/**
 * An entry describing a follow up with a given person
 *
 * @since 0.1.0
 */
class Process implements Auditable {

    /**
     * A process belongs to a given person, and can be
     * related to a given project
     *
     * @since 0.1.0
     */
    static belongsTo = [
        type: ProcessType,
        person: Person,
        project: Project
    ]

    /**
     * A process could have multiple attachments
     *
     * @since 0.1.0
     */
    static hasMany = [
        attachments: ProcessAttachment
    ]

    /**
     * When the meeting took place
     *
     * @since 0.1.0
     */
    @BindingFormat('dd/MM/yyyy')
    Date meetingDate

    /**
     * A brief description about the process

     * @since 0.1.0
     */
    String description

    /**
     * The full content of the process. This field
     * is meant to be a long rich text
     *
     * @since 0.1.0
     */
    String content

    @Override
    String toString() {
        return description
    }

    /**
     * Validation constraints
     *
     * @since 0.1.0
     */
    static constraints = {
        description nullable: false
        content nullable: false
        type nullable: false
        meetingDate nullable: false
    }

    /**
     * Low level database details
     *
     * @since 0.1.0
     */
    static mapping = {
        sort meetingDate: 'desc'
        content type: 'text'
        attachments cascade: 'all-delete-orphan'
    }
}
