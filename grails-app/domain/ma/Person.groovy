package ma

import grails.databinding.BindingFormat
import ma.person.Address
import ma.person.Administration
import ma.person.Health
import ma.person.Identification
import ma.person.OccupationalTraining
import ma.person.PersonalInformation
import ma.person.SocialServices

class Person implements Auditable, Identification, PersonalInformation, Administration, Address, OccupationalTraining, Health, SocialServices {

    static belongsTo = [project: Project]

    @BindingFormat('dd/MM/yyyy')
    Date registrationAt

    @BindingFormat('dd/MM/yyyy')
    Date birthDate

    static constraints = {
        project nullable: true
        identification nullable: false

        street nullable: true
        streetType nullable: true
        number nullable: true
        ladder nullable: true
        floor nullable: true
        door nullable: true
        neighborhood nullable: true
        district nullable: true
        postalCode nullable: true
        contact2 nullable: true
        contact3 nullable: true

        type nullable: true
        identification nullable: true

        allergies nullable: true
        illnesses nullable: true
        medication nullable: true

        professionalReference nullable: true
        cameFromAlternative nullable: true
        deletionMotivation nullable: true
        deletedAt nullable: true

        studiesLevel nullable: true
        studiesCenter nullable: true
        professionalStatus nullable: true
        professionalBackground nullable: true

        secondSurname nullable: true
        nationality nullable: true
        regionOfBirth nullable: true
        culturalUpbringing nullable: true

        otherResourcesCase nullable: true
        socialWorker nullable: true
        cafCase nullable: true
        center nullable: true
        etmfCase nullable: true
    }
}
