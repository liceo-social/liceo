package ma


class Process extends Auditable {

    static belongsTo = [project: Project]

    String description
    ProcessType type
}
