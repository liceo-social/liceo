package ma

import ma.domain.Utils

class ProcessType implements Auditable {

    static belongsTo = Process

    String name
    String description

    String toString() {
        Utils.getAcronym(this, "name")        
    }

    static constraints = {
        name nullable: false
        description nullable: true
    }
}
