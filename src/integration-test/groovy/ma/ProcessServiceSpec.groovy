package ma

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ProcessServiceSpec extends Specification {

    ProcessService processService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Process(...).save(flush: true, failOnError: true)
        //new Process(...).save(flush: true, failOnError: true)
        //Process process = new Process(...).save(flush: true, failOnError: true)
        //new Process(...).save(flush: true, failOnError: true)
        //new Process(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //process.id
    }

    void "test get"() {
        setupData()

        expect:
        processService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Process> processList = processService.list(max: 2, offset: 2)

        then:
        processList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        processService.count() == 5
    }

    void "test delete"() {
        Long processId = setupData()

        expect:
        processService.count() == 5

        when:
        processService.delete(processId)
        sessionFactory.currentSession.flush()

        then:
        processService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Process process = new Process()
        processService.save(process)

        then:
        process.id != null
    }
}
