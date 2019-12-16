package ma

class Project extends Auditable {

    static hasMany = [processes: Process]

    String name
    String description
}
