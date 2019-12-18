package ma

import static com.xlson.groovycsv.CsvParser.parseCsv

import groovy.util.logging.Slf4j
import ma.person.Address
import ma.person.Administration
import ma.person.CameFrom
import ma.person.DocumentType
import ma.person.Identification
import ma.security.User
import net.bytebuddy.implementation.bytecode.Throw

import java.text.SimpleDateFormat
import java.time.LocalDateTime

@Slf4j
class ImportCsvService {

    private static final String USERS_CSV_FILE = "csv/users.csv"
    private static final String PERSONS_CSV_FILE = "csv/persons.csv"

    def loadInitialData() {
        log.debug 'Creating initial data ...'

        try {
            loadUsers()
            loadPersons()

            log.debug '... finished creating initial data'
            log.debug ''
        } catch (Throwable th) {
            log.error("ERROR EN CARGA DE DATOS", th)
        }

    }

    void loadUsers() {
        String csv = new File(USERS_CSV_FILE).getText('UTF-8')

        def userDataList = parseCsv(csv)
        userDataList.each { userData ->
            User user  = new User(
                name: userData.name,
                username: userData.username,
                password: userData.password
            ).save(failOnError: true)
        }
    }

    void loadPersons() {
        String csv = new File(PERSONS_CSV_FILE).getText('UTF-8')

        def personDataList = parseCsv(csv)
        personDataList.each { personData ->

            Identification identification  = new Identification(
                active: personData.active,
                professionalReference: User.get(personData.professionalReference),
                cameFrom: new CameFrom(name: personData.cameFrom).save(),
                registrationAt: personData.registrationAt ?
                    new SimpleDateFormat('dd/MM/yyyy').parse(personData.registrationAt)
                    : null,
                deletedAt: personData.deletedAt ?
                    new SimpleDateFormat('dd/MM/yyyy').parse(personData.deletedAt)
                    : null,
                deletionMotivation:  personData.deletionMotivation
            ).save(failOnError: true)

            Administration administration = new Administration(
                type: new DocumentType(name: personData.identification ),
                identification: personData.identification
            ).save(failOnError: true)

            Address address = new Address(
                streetType: personData.streetType,
                street: personData.street,
                number: personData.number,
                ladder: personData.ladder,
                floor: personData.floor,
                door: personData.door,
                neighborhood: personData.neighborhood,
                district: personData.district,
                postalCode: personData.postalCode,
                contact1: personData.contact1,
                contact2: personData.contact2,
                contact3: personData.contact3
            ).save(failOnError: true)

            Person person = new Person(
                identification: identification,
                administration: administration,
                address: address,
                // TODO: Finish next fieldsets
//                occupationalTraining: ,
//                health: ,
//                socialServices:
            ).save(failOnError: true)
        }
    }
}
