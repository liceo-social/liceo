package ma.migrations.m_0_2_0

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.SpringSecurityService
import groovy.sql.Sql
import ma.security.Requestmap
import org.springframework.beans.factory.annotation.Autowired

import javax.inject.Inject
import javax.sql.DataSource

/**
 * Hay una serie de pantallas por defecto solo autorizadas para administradores.
 *
 * @since 0.2.0
 */
@Transactional
class Issue23Service {

  @Autowired
  SpringSecurityService springSecurityService

  static final List<String> MAPPINGS_EDIT_DELETE_ONLY_ADMIN = [
    'processType',
    'project',
    'sex',
    'genre',
    'cameFrom',
    'country',
    'documentType'
  ]

  static final List<String> MAPPINGS_BOTH_USER_ADMIN = [
    '/', '/**'
  ]

  void load() {
    Requestmap
      .findAllByUrlInList(MAPPINGS_BOTH_USER_ADMIN)
      .each { Requestmap mapping ->
        mapping.delete(flush: true)
      }

    // asegurando que solo un admin puede acceder a estas urls
    MAPPINGS_EDIT_DELETE_ONLY_ADMIN
      .collectMany {url -> ["/$url/edit/**", "/$url/delete/**", "/$url/save/**", "/$url/update/**"] }
      .each { String url ->
        new Requestmap(url: url, configAttribute: ['ROLE_ADMIN']).save()
      }

    // volviendo a dejar como ultimas por defecto root y root wildcard
    MAPPINGS_BOTH_USER_ADMIN.each { String url ->
      new Requestmap(url: url, configAttribute: ['ROLE_USER', 'ROLE_ADMIN']).save()
    }

    // invalidate previous URL mappings
    springSecurityService.clearCachedRequestmaps()
  }
}
