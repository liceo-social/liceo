package ma


class Process {

    static belongsTo = [
        project: Project,
        person: Person
    ]

    String description
    ProcessType type
    // Person person

    String toString() {
        return description
    }
}
