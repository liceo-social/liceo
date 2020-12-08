package ma.migrations.m_0_2_0

import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import groovy.util.logging.Slf4j
import ma.security.User
import ma.security.UserAuthority
import org.springframework.beans.factory.annotation.Autowired

import javax.sql.DataSource
import java.sql.Connection

@Slf4j
@Transactional
class Issue18Service {

  static final List<String> TABLES = [
    "person",
    "person_authorization",
    "process",
    "process_type",
    "project",
    "relationship"
  ]

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

    new Sql(dataSource).withTransaction { Connection conn ->
      Sql sql = new Sql(conn)
      sql.withBatch(TABLES.size()) {
        TABLES.each { String table ->
          saveOwnerFor(sql, table, admin)
        }
      }
    }

    log.debug("missing owner migration done")
  }

  private static void saveOwnerFor(Sql sql, String table, User admin) {
    String query = "UPDATE $table SET created_by_id = :userID WHERE ${table}.created_by_id is NULL"
    sql.executeUpdate(query, userID: admin.id)
  }
}
