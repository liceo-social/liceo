package ma.person

import ma.security.User

class Identification {

    boolean active
    User professionalReference
    CameFrom cameFrom
    String cameFromAlternative

    Date deletedAt
    String deletionMotivation
}
