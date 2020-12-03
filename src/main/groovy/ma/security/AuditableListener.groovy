package ma.security

import grails.events.annotation.gorm.Listener
import grails.plugin.springsecurity.SpringSecurityService
import org.grails.datastore.mapping.engine.event.EventType
import org.grails.datastore.mapping.engine.event.PreInsertEvent
import org.grails.datastore.mapping.engine.event.PreUpdateEvent
import org.springframework.beans.factory.annotation.Autowired
import ma.Auditable

/**
 * Everytime an entity instance of type {@link Auditable} is persisted the auditable
 * fields are created or updated
 *
 * @since 0.2.0
 */
class AuditableListener {

  @Autowired
  SpringSecurityService springSecurityService

  @Listener(Auditable)
  void onPreInsertEvent(PreInsertEvent event) {
      Auditable auditable = event.entityObject as Auditable
      User user = User.get(springSecurityService.currentUser.id)

      event.entityAccess.setProperty('createdBy', user)

      if (!auditable.updatedBy) {
        event.entityAccess.setProperty('updatedBy', user)
      }
  }

  @Listener(Auditable)
  void onPreUpdateEvent(PreUpdateEvent event) {
    event.entityAccess.setProperty('updatedBy', springSecurityService.currentUser)
  }
}
