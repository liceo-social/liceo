package ma

import grails.plugin.springsecurity.SpringSecurityService
import ma.security.User

/**
 * This tag library resolves security data to show in GSPs such
 * as the logged user image
 *
 * @since 0.1.0
 */
class SecurityTagLib {

    /**
     * Tag namespace
     *
     * @since 0.1.0
     */
    static namespace = 'masec'

    /**
     * Access to security context in application
     *
     * @since 0.1.0
     */
    SpringSecurityService springSecurityService

    /**
     * Shows current user photo
     *
     * @since 0.1.0
     */
    def userPhoto = { attrs, body ->
        User user = User.findById(springSecurityService.currentUser.id)

        out << '<img class="img-circle elevation-2" src="/storage/' + user.photo.filename + '" alt="User Image">'
    }

    /**
     * Shows current user's name
     *
     * @since 0.1.0
     */
    def userName = {
        User user = User.findById(springSecurityService.currentUser.id)

        out << user.name
    }
}
