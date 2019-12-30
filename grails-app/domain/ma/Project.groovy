package ma

import ma.domain.Utils

class Project implements Auditable {

    static belongsTo = Person
    static hasMany = [
        processes: Process,
        persons: Person
    ]

    String name
    String description

    String getAcronym() {
        return Utils.getAcronym(this, "name")
    }

    String getCompleteName() {
        return "$name ($acronym)"
    }

    String toString() {
        return acronym
    }

    static constraints = {
        name nullable: false
        description nullable: true
    }
}
