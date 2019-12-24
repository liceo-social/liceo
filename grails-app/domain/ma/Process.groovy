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
    ProcessType type

    String toString() {
        return description
    }

    static constraints = {
        description nullable: false
        type nullable: false
        meetingDate nullable: true
    }

    static mapping = {
        sort meetingDate: 'desc'
    }
}
