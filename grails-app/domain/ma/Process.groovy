package ma

class Process implements Auditable {

    static belongsTo = [
        person: Person,
        project: Project
    ]

    String description
    ProcessType type

    String toString() {
        return description
    }

    static constraints = {
        description nullable: false
        type nullable: false
    }
}
