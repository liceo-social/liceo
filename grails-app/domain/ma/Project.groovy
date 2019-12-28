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

    String toString() {
        return Utils.getAcronym(this, "name")
    }

    static constraints = {
        name nullable: false
        description nullable: true
    }
}
