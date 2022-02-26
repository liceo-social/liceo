package ma

import grails.databinding.BindingFormat
import ma.person.Address
import ma.person.Administration
import ma.person.Health
import ma.person.Identification
import ma.person.OccupationalTraining
import ma.person.PersonalInformation
import ma.person.SocialServices
import ma.security.User
import ma.storage.Attachment
import ma.domain.Utils
import social.liceo.model.DeactivationRequestEntity

class Person extends Auditable implements Dateable, Identification, PersonalInformation, Administration, Address, OccupationalTraining, Health, SocialServices {

    static hasMany = [projects: Project, notes: Note]

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

        deletionRequestedBy nullable: true
        deletionApprovedBy nullable: true
        deletionMotivation nullable: true
        deletedAt nullable: true

        studiesLevel nullable: true
        studiesCenter nullable: true
        professionalStatus nullable: true
        professionalBackground nullable: true

        otherResourcesCase nullable: true
        socialWorker nullable: true

        center nullable: true

        photo nullable: true
    }

    Integer getAge() {
        return Utils.calculateAge(this.birthDate)
    }

    Boolean isDeactivationRequested() {
      return deactivation
    }

    User getDeactivationRequestedBy() {
      return this.deletionRequestedBy ?: deactivation?.requestedBy
    }

    User getDeactivationApprovedBy() {
      return this.deletionApprovedBy
    }

    String getDeactivationMotivation() {
      return this.deletionMotivation ?: deactivation?.motivation
    }

    private DeactivationRequestEntity getDeactivation() {
      return DeactivationRequestEntity?.findByPerson(this)?.find()
    }

    Map<String, Integer> getNoteStatistics() {
      return [
        notes: notes.count { it.severity == 'NOTE' && !it.resolutionDate },
        warnings: notes.count { it.severity == 'WARNING' && !it.resolutionDate },
        dangers: notes.count { it.severity == 'DANGER' && !it.resolutionDate }
      ]
    }

    static mapping = {
        // This allows to query fullname in the database instead of getting only the value
        fullname formula: "NAME||' '||FIRST_SURNAME||' '||COALESCE(SECOND_SURNAME, '')"
        deletionMotivation type: 'text'
    }

    @Override
    String toString() {
        return name
    }
}
