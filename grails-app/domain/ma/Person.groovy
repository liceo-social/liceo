package ma

import grails.databinding.BindingFormat
import ma.person.Address
import ma.person.Administration
import ma.person.Health
import ma.person.Identification
import ma.person.OccupationalTraining
import ma.person.PersonalInformation
import ma.person.SocialServices
import ma.storage.Attachment
import ma.domain.Utils

class Person extends Auditable implements Dateable, Identification, PersonalInformation, Administration, Address, OccupationalTraining, Health, SocialServices {

    static hasMany = [projects: Project]

    String fullname

    @BindingFormat('dd/MM/yyyy')
    Date registrationAt

    @BindingFormat('dd/MM/yyyy')
    Date birthDate

    Boolean active = true

    Attachment photo

    static constraints = {
        name nullable: false
        firstSurname nullable: false
        secondSurname nullable: true
        nationality nullable: true
        regionOfBirth nullable: true
        culturalUpbringing nullable: true
        genre nullable: false
        sex nullable: false

        projects nullable: true
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

        documentType nullable: true
        identification nullable: true

        allergies nullable: true
        illnesses nullable: true
        medication nullable: true

        professionalReference nullable: false
        cameFromAlternative nullable: true
        deletionMotivation nullable: true
        deletedAt nullable: true

        studiesLevel nullable: true
        studiesCenter nullable: true
        professionalStatus nullable: true
        professionalBackground nullable: true

        otherResourcesCase nullable: true
        socialWorker nullable: true
        cafCase nullable: true
        center nullable: true
        etmfCase nullable: true

        photo nullable: true
    }

    Integer getAge() {
        return Utils.calculateAge(this.birthDate)
    }

    static mapping = {
        // This allows to query fullname in the database instead of getting only the value
        fullname formula: "NAME||' '||FIRST_SURNAME||' '||COALESCE(SECOND_SURNAME, '')"
    }

    @Override
    String toString() {
        return name
    }
}
