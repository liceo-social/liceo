package ma

import ma.domain.Utils

class Project extends Auditable implements Dateable {

    static belongsTo = Person
    static hasMany = [
        processes: Process,
        persons: Person
    ]

    String name
    String code
    String description

    String getAcronym() {
        return Utils.getAcronym(this, "name")
    }

    String getCompleteName() {
        return "$name ($code)"
    }

    String toString() {
        return code
    }

    def beforeInsert() {
      if (!code) {
        code = this.acronym
      }
    }

    def beforeUpdate() {
      if (!code) {
        code = this.acronym
      }
    }

    static constraints = {
        name nullable: false
        code nullable: true
        description nullable: true
    }
}
