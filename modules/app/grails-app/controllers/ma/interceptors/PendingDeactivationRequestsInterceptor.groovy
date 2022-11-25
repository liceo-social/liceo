package ma.interceptors

import grails.artefact.Interceptor
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.beans.factory.annotation.Autowired
import social.liceo.model.DeactivationRequestEntity

@SuppressWarnings("unused")
class PendingDeactivationRequestsInterceptor implements Interceptor {
  @Autowired
  SpringSecurityService springSecurityService

  PendingDeactivationRequestsInterceptor() {
    matchAll()
      .except(uri:'/error')
      .except(controller: 'login')
      .except(controller: 'storage')
      .except(controller: 'attachment')
  }

  boolean after() {
    def user = springSecurityService.currentUser

    if (user.isAdmin()) {
      session.pendingDeactivations = DeactivationRequestEntity.count()
    } else {
      session.pendingDeactivations = null
    }

    return true
  }
}
