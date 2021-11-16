package ma.migrations.m_0_2_0

import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import groovy.util.logging.Slf4j
import ma.Project
import ma.security.User
import ma.security.UserAuthority
import org.springframework.beans.factory.annotation.Autowired

import javax.sql.DataSource

@Slf4j
@Transactional
class Issue5Service {

  @Autowired
  DataSource dataSource

  void load() {
    def query = UserAuthority.where {
      authority.authority == 'ROLE_ADMIN'
    }
    User admin = query?.first()?.person

    if (!admin) {
      throw new Exception("NO ADMIN FOUND TO SET DEFAULT OWNER!")
    }

    def sql = new Sql(dataSource)
    def projectCodeMap = Project
      .list()
      .collectEntries { Project p -> [(p.id):p.acronym] } as Map<Integer, String>

    sql.withBatch(projectCodeMap.size()) {wrapper ->
      projectCodeMap.each {id, code ->
        wrapper.addBatch("update project set code = '$code' where id = $id")
      }
      wrapper.executeBatch()
    }

    log.debug("0.2.0 (#5): projects code migration done")
  }
}
