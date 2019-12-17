package ma

class ProcessType {

    static belongsTo = Process

    String name
    String description

    String toString() {
        return name
    }

    static constraints = {
        description nullable: true
    }
}
