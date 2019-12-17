package ma

class Person {

    static belongsTo = Project
    static hasMany = [
        projects: Project
    ]

    String name

    String toString() {
        return name
    }
}
