package ma.security

import grails.plugin.springsecurity.SpringSecurityService
import org.grails.datastore.mapping.engine.event.AbstractPersistenceEvent
import org.grails.datastore.mapping.engine.event.PreInsertEvent
import org.grails.datastore.mapping.engine.event.PreUpdateEvent
import org.springframework.beans.factory.annotation.Autowired
import grails.events.annotation.gorm.Listener
import groovy.transform.CompileStatic

@CompileStatic
class PersonPasswordEncoderListener {

    @Autowired
    SpringSecurityService springSecurityService

    @Listener(User)
    void onPreInsertEvent(PreInsertEvent event) {
        encodePasswordForEvent(event)
    }

    @Listener(User)
    void onPreUpdateEvent(PreUpdateEvent event) {
        encodePasswordForEvent(event)
    }

    private void encodePasswordForEvent(AbstractPersistenceEvent event) {
        if (event.entityObject instanceof User) {
            User u = event.entityObject as User
            if (u.password && (whenInserting(event) || whenUpdatingAndDirty(event))) {
                event.entityAccess.setProperty('password', encodePassword(u.password))
            }
        }
    }

    private boolean whenInserting(AbstractPersistenceEvent event) {
        return event instanceof PreInsertEvent
    }

    private boolean whenUpdatingAndDirty(AbstractPersistenceEvent event) {
        User u = event.entityObject as User

        return event instanceof PreUpdateEvent && u.isDirty('password')
    }

    private String encodePassword(String password) {
        springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}
