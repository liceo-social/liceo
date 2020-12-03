package ma.security

import grails.plugin.springsecurity.SpringSecurityService

/**
 * Service used to wrap all security rules related to access to different entity operations
 *
 * @since 0.2.0
 */
class SecurityRulesService {

  SpringSecurityService springSecurityService

  /**
   * Tells whether the logged user is the same as the user who created
   * the record or an admin. If the logged user is not the same as the
   * user who created the record or an admin the function will return
   * false.
   *
   * @param createdBy the user who created the record
   * @return true if the user was the same as the {@link User} passed as
   * parameter or an admin user, false otherwise
   * @since 0.2.0
   */
  Boolean isCreatedByOrAdmin(User createdBy) {
    User loggedUser = User.get(springSecurityService.currentUser?.id)
    return loggedUser == createdBy || loggedUser.isAdmin()
  }
}
