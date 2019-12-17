package ma

class ProcessType implements Auditable {

    static belongsTo = Process

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
