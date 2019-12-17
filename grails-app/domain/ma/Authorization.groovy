package ma

class Authorization {

    static belongsTo = [
      project: Project,
      person: Person
    ]

    String name
}
