package ma

import static com.xlson.groovycsv.CsvParser.parseCsv

import groovy.util.logging.Slf4j
import ma.person.CameFrom
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
            println "============> identificationData: $personData"
            Identification identification  = new Identification(
                active: personData.active,
                professionalReference: User.get(personData.professionalReference),
                cameFrom: new CameFrom(name: personData.cameFrom).save(),
                registrationAt:  new SimpleDateFormat('dd/MM/yyyy').parse(personData.registrationAt),
                deletedAt:  personData.deletedAt,
                deletionMotivation:  personData.deletionMotivation
            ).save(failOnError: true)
        }
    }
}
