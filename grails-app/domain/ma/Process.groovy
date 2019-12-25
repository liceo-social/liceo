package ma

import grails.databinding.BindingFormat

class Process implements Auditable {

    static belongsTo = [
        person: Person,
        project: Project
    ]

    @BindingFormat('dd/MM/yyyy')
    Date meetingDate
    String description
    String content
    ProcessType type

    String toString() {
        return description
    }

    static constraints = {
        description nullable: false
        content nullable: false
        type nullable: false
        meetingDate nullable: false
    }

    static mapping = {
        sort meetingDate: 'desc'
        content type: 'text'
    }
}
