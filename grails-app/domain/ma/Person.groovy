package ma

import ma.person.Address
import ma.person.Administration
import ma.person.Health
import ma.person.Identification
import ma.person.OccupationalTraining
import ma.person.PersonalInformation
import ma.person.SocialServices

class Person implements Auditable {

    static belongsTo = [project: Project]

    Identification identification
    PersonalInformation personalInformation
    Administration administration
    Address address
    OccupationalTraining occupationalTraining
    Health health
    SocialServices socialServices

    static constraints = {
        identification nullable: false
        personalInformation nullable: false
        administration nullable: false
        address nullable: false
        occupationalTraining nullable: false
        health nullable: false
        socialServices nullable: false
    }
}
