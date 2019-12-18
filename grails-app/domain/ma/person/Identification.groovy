package ma.person

import ma.security.User

class Identification {

    boolean active
    User professionalReference
    CameFrom cameFrom
    String cameFromAlternative

    Date registrationAt
    Date deletedAt
    String deletionMotivation

    static constraints = {
        professionalReference nullable: true
        cameFromAlternative nullable: true
    }
}
