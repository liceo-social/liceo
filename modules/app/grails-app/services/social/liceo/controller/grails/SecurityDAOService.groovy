package social.liceo.controller.grails

import grails.plugin.springsecurity.SpringSecurityService
import ma.security.User as GrailsUser
import social.liceo.controller.SecurityDAO
import social.liceo.model.User

class SecurityDAOService implements SecurityDAO {
  private SpringSecurityService springSecurityService

  SecurityDAOService(SpringSecurityService springSecurityService) {
    this.springSecurityService = springSecurityService
  }

  @Override
  User getSessionUser() {
    GrailsUser user = springSecurityService.currentUser as GrailsUser
    List<String> roles = user.authorities.authority
    return new User(id: user.id, roles: roles)
  }
}
