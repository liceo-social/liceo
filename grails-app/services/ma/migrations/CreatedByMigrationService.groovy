package ma.migrations

import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j
import ma.Authorization
import ma.Person
import ma.Process
import ma.ProcessType
import ma.Project
import ma.Relationship
import ma.security.User
import ma.security.UserAuthority

@Slf4j
@Transactional
class CreatedByMigrationService {

  void load() {
    def query = UserAuthority.where {
      authority.authority == 'ROLE_ADMIN'
    }
    User admin = query?.first()?.person

    if (!admin) {
      throw new Exception("NO ADMIN FOUND TO SET DEFAULT OWNER!")
    }

    def people = Person.findAllByCreatedByIsNull()
    def authorizations = Authorization.findAllByCreatedByIsNull()
    def processes = Process.findAllByCreatedByIsNull()
    def processTypes = ProcessType.findAllByCreatedByIsNull()
    def projects = Project.findAllByCreatedByIsNull()
    def relationships = Relationship.findAllByCreatedByIsNull()

    [people, authorizations, processes, processTypes, projects, relationships].each { List records ->
      saveOwnerFor(records, admin)
    }

    log.debug("missing owner migration done")
  }

  private void saveOwnerFor(List records, User admin) {
    records.each { record ->
      record.createdBy = admin
      record.save(flush: true)
    }
  }
}
