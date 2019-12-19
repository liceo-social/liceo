package ma

import static com.xlson.groovycsv.CsvParser.parseCsv

import groovy.util.logging.Slf4j
import ma.person.CameFrom
import ma.person.Country
import ma.person.DocumentType
import ma.person.Genre
import ma.security.User

import java.text.SimpleDateFormat

@Slf4j
class ImportCsvService {

    private static final String USERS_CSV_FILE = "csv/users.csv"
    private static final String PERSONS_CSV_FILE = "csv/persons.csv"
    private static final String PROCESS_TYPES_CSV_FILE = "csv/process_types.csv"
    private static final String PROCESSES_CSV_FILE = "csv/processes.csv"
    private static final String PROJECTS_CSV_FILE = "csv/projects.csv"

    def loadInitialData() {
        log.debug 'Creating initial data ...'

        try {
            loadUsers()
            loadProcessTypes()
            loadPersons()
            loadProjects()
            loadProcesses()

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

    void loadProcessTypes() {
        String csv = new File(PROCESS_TYPES_CSV_FILE).getText('UTF-8')

        def processTypesList = parseCsv(csv)

        processTypesList.each { processTypeData ->
            ProcessType processType = new ProcessType(
               name: processTypeData.name,
               description: processTypeData.description
            ).save(failOnError: true)
        }
    }

    void loadProjects() {
        String csv = new File(PROJECTS_CSV_FILE).getText('UTF-8')

        def projectsList = parseCsv(csv)

        projectsList.each { projectsData ->
            Project project = new Project(
                name: projectsData.name,
                description: projectsData.description
            ).save(failOnError: true)
        }
    }

    void loadProcesses() {
        String csv = new File(PROCESSES_CSV_FILE).getText('UTF-8')

        def processList = parseCsv(csv)

        processList.each { processData ->
            Process processType = new Process(
                meetingDate: processData.meetingDate ?
                    new SimpleDateFormat('dd/MM/yyyy').parse(processData.meetingDate)
                    : null,
                description: processData.description,
                type: ProcessType.get(processData.typeId),
                person: Person.get(processData.personId),
                project: Project.get(processData.projectId),
            ).save(failOnError: true)
        }
    }

    void loadPersons() {
        String csv = new File(PERSONS_CSV_FILE).getText('UTF-8')

        def personDataList = parseCsv(csv)
        personDataList.each { personData ->

            Person person = new Person(

                birthDate: personData.birthDate,

                // personalInformation
                name: personData.name ,
                firstSurname: personData.firstSurname,
                secondSurname: personData.secondSurname,
                genre: new Genre(name: personData.genre),
                nationality: new Country(name: personData.nationality),
                regionOfBirth: personData.regionOfBirth,
                culturalUpbringing: new Country(name: personData.culturalUpbringing),

                // identification
                active: personData.active,
                professionalReference: User.get(personData.professionalReference),
                cameFrom: new CameFrom(name: personData.cameFrom).save(),
                registrationAt: personData.registrationAt ?
                    new SimpleDateFormat('dd/MM/yyyy').parse(personData.registrationAt)
                    : null,
                deletedAt: personData.deletedAt ?
                    new SimpleDateFormat('dd/MM/yyyy').parse(personData.deletedAt)
                    : null,
                deletionMotivation:  personData.deletionMotivation,

                // administration
                type: new DocumentType(name: personData.identification ),
                identification: personData.identification,

                // address
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
                contact3: personData.contact3,

                // occupationalTraining
                studiesLevel: personData.studiesLevel,
                studiesCenter: personData.studiesCenter,
                professionalStatus: personData.professionalStatus,
                professionalBackground: personData.professionalBackground,

                // health
                allergies: personData.allergies,
                illnesses: personData.illnesses,
                medication: personData.medication,

                // socialServices
                center: personData.center,
                socialWorker: personData.socialWorker,
                hasOtherResourcesCase: personData.hasOtherResourcesCase,
                otherResourcesCase: personData.otherResourcesCase,
                hasPrimaryAttentionFile: personData.hasPrimaryAttentionFile,
                etmfCase: personData.etmfCase,
                hasCaiFile: personData.hasCaiFile,
                cafCase: personData.cafCase,

            ).save(failOnError: true)
        }
    }
}
