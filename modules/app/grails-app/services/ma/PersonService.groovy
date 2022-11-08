package ma

import grails.gorm.transactions.Transactional
import grails.gorm.services.Service
import ma.person.SearchCommand
import org.grails.datastore.mapping.query.api.BuildableCriteria

import social.liceo.data.csv.CSVTransformer
import social.liceo.data.csv.CSVWriter

import java.nio.file.Files
import java.text.SimpleDateFormat

/**
 * Handles {@link Person} business processes
 *
 * @since 0.2.0
 */
@Service(Person)
abstract class PersonService implements IPersonService {

  private static final Map<String,?> EMPTY_FIELD_GROUP = [:]

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

      if (command.sexes) {
        "in"("sex", command.sexes)
      }

      if (command.countries) {
        "in"("nationality", command.countries)
      }

      if (command.projects) {
        projects {
          "in"("id", command.projects*.id)
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

    String dateFormat = new SimpleDateFormat("yyyy-MM-dd").format(new Date())
    File temporalFile = Files.createTempFile("liceo-${dateFormat}-", ".csv").toFile()

    CSVTransformer<Person> csvTransformer = { Person person ->
      getPersonalFieldMap(person) +
      getContactFieldMap(person, command.exportContact) +
      getAdministrationFieldMap(person, command.exportAdministration) +
      getHealthFieldMap(person, command.exportHealth) +
      getWorkFieldMap(person, command.exportWork) +
      getSocialFieldMap(person, command.exportSocial)
    }

    CSVWriter.builder()
      .lines(result)
      .transformer(csvTransformer)
      .build()
      .writeTo(temporalFile.newWriter('UTF-8'))

    return temporalFile
  }

  private static Map<String,?> getPersonalFieldMap(Person person) {
    return [
      fullname: person.fullname,
      active: person.active,
      registeredAt: person.registrationAt,
      birthDate: person.birthDate,
      name: person.name,
      sex: person.sex.name,
      genre: person.genre.name,
      firstSurname: person.firstSurname,
      secondSurname: person.secondSurname,
      nationality: person.nationality?.name,
      regionOfBirth: person.regionOfBirth,
      culturalUpbringing: person.culturalUpbringing?.name,
      deletionMotivation: person.deletionMotivation,
      deletedAt: person.deletedAt,
    ]
  }

  private static Map<String,?> getAdministrationFieldMap(Person person, boolean export) {
    if (export) {
      return [
        documentType  : person.documentType?.name,
        identification: person.identification,
      ]
    }
    return EMPTY_FIELD_GROUP
  }

  private static Map<String,?> getContactFieldMap(Person person, boolean export) {
    if (export) {
      return [
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
      ]
    }
    return EMPTY_FIELD_GROUP
  }

  private static Map<String,?> getWorkFieldMap(Person person, boolean export) {
    if (export) {
      return [
        studiesLevel: person.studiesLevel,
        studiesCenter: person.studiesCenter,
        professionalStatus: person.professionalStatus,
        professionalBackground: person.professionalBackground,
      ]
    }
    return EMPTY_FIELD_GROUP
  }

  private static Map<String,?> getHealthFieldMap(Person person, boolean export) {
    if (export) {
      return [
        allergies: person.allergies,
        illnesses: person.illnesses,
        medication: person.medication,
      ]
    }
    return EMPTY_FIELD_GROUP
  }

  private static Map<String,?> getSocialFieldMap(Person person, boolean export) {
    if (export) {
      return [
        otherResourcesCase: person.otherResourcesCase,
        socialWorker: person.socialWorker,
        hasCafCase: person.hasCafCase,
        hasCaiCase: person.hasCaiCase,
        center: person.center,
        hasEtmfCase: person.hasEtmfCase,
        professionalReference: person.professionalReference.name,
        cameFromAlternative: person.cameFromAlternative,
        hasPrimaryAttentionFile: person.hasPrimaryAttentionFile
      ]
    }
    return EMPTY_FIELD_GROUP
  }

  @Override
  @Transactional
  void enable(Person person) {
    person.deletionMotivation = null
    person.deletionApprovedBy = null
    person.deletionRequestedBy = null
    person.deletedAt = null
    person.active = true
  }
}
