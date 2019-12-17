package ma

class Project implements Auditable {

    static belongsTo = Person
    static hasMany = [
        processes: Process,
        persons: Person
    ]

    String name
    String description

    String toString() {
        return name
    }

    static constraints = {
        name nullable: false
        description nullable: true
    }
}
