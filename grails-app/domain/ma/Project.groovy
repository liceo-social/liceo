package ma

class Project {

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
        description nullable: true
    }
}
