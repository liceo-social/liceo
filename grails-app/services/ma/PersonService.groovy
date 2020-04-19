package ma

import grails.gorm.transactions.Transactional
import ma.csv.CSV
import ma.csv.CSVWriter
import grails.gorm.services.Service
import ma.person.SearchCommand
import org.grails.datastore.mapping.query.api.BuildableCriteria

import java.nio.file.Files
import java.text.SimpleDateFormat

/**
 * Handles {@link Person} business processes
 *
 * @since 0.2.0
 */
@Service(Person)
abstract class PersonService implements IPersonService {

  /**
   * Search people matching certain criterion
   *
   * @param command object containing search form data
   * @return
   * @since 0.2.0
   */
  @Override
  List<Person> search(SearchCommand command) {
    BuildableCriteria criteria = Person.createCriteria()

    return criteria.list(max: command.max, offset: command.offset) {
      if (command.name) {
        ilike("fullname", "%${command.name}%")
      }

      if (command.minAge) {
        le("birthDate", command.minDate)
      }

      if (command.showOnlyActive) {
        eq("active", command.showOnlyActive)
      }

      if (command.maxAge) {
        ge("birthDate", command.maxDate)
      }

      if (command.genres) {
        "in"("genre", command.genres)
      }

      if (command.countries) {
        "in"("nationality", command.countries)
      }

      if (command.projects) {
        projects {
          "in"("id", command.projects.id)
        }
      }

      if (command.handlers) {
        "in"("professionalReference", command.handlers)
      }

      if (command.cameFrom) {
        "in"("cameFrom", command.cameFrom)
      }

      if (command.sort) {
        order(command.sort, command.order)
      }

      if (command.offset) {
        firstResult(command.offset)
      }
    }
  }

  /**
   * Creates a CSV file with the search result
   *
   * @param the search criteria
   * @return a File containing the exported result
   * @since 0.2.0
   */
  File createSearchResultFile(SearchCommand command) {
    List<Person> result = search(command)
    CSVWriter writer = CSV.from(result) { Person person ->
      return [
        fullname: person.fullname,
        active: person.active,
        registeredAt: person.registrationAt,
        birthDate: person.birthDate,
        name: person.name,
        firstSurname: person.firstSurname,
        secondSurname: person.secondSurname,
        nationality: person.nationality?.name,
        regionOfBirth: person.regionOfBirth,
        culturalUpbringing: person.culturalUpbringing?.name,
        identification: person.identification,
        streetType: person.streetType,
        street: person.street,
        number: person.number,
        ladder: person.ladder,
        floor: person.floor,
        door: person.door,
        neighborhood: person.neighborhood,
        district: person.district,
        postalCode: person.postalCode,
        contact2: person.contact2,
        contact3: person.contact3,
        documentType: person.documentType?.name,
        allergies: person.allergies,
        illnesses: person.illnesses,
        medication: person.medication,
        professionalReference: person.professionalReference.name,
        cameFromAlternative: person.cameFromAlternative,
        deletionMotivation: person.deletionMotivation,
        deletedAt: person.deletedAt,
        studiesLevel: person.studiesLevel,
        studiesCenter: person.studiesCenter,
        professionalStatus: person.professionalStatus,
        professionalBackground: person.professionalBackground,
        otherResourcesCase: person.otherResourcesCase,
        socialWorker: person.socialWorker,
        cafCase: person.cafCase,
        center: person.center,
        etmfCase: person.etmfCase
      ]
    }
    String dateFormat = new SimpleDateFormat("yyyy-MM-dd").format(new Date())
    File temporalFile = Files
      .createTempFile("masiaventura-${dateFormat}-", ".csv")
      .toFile()

    writer.writeTo(temporalFile.newWriter())

    return temporalFile
  }

  @Override
  @Transactional
  void disable(Person person, String motivation) {
    person.deletionMotivation = motivation
    person.deletedAt = new Date()
    person.active = false
  }

  @Override
  @Transactional
  void enable(Person person) {
    person.deletionMotivation = null
    person.deletedAt = null
    person.active = true
  }
}
