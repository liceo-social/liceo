package ma.person

import ma.security.User

trait Identification {

    User professionalReference
    CameFrom cameFrom
    String cameFromAlternative
    Date deletedAt
    User deletionApprovedBy
    User deletionRequestedBy
    String deletionMotivation
}
