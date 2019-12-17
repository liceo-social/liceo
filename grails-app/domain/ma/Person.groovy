package ma

class Person implements Auditable {

    static belongsTo = [
        project:Project
    ]

    String name

    String toString() {
        return name
    }

    static constraints = {
        name nullable: false
        project nullable: true
    }
}
