package ma.person

import grails.databinding.BindingFormat
import ma.security.User

trait Identification {

    boolean active = true
    User professionalReference
    CameFrom cameFrom
    String cameFromAlternative
    Date deletedAt
    String deletionMotivation
}
