package ma

import ma.person.CameFrom
import ma.person.Country
import ma.person.DocumentType
import ma.person.Genre
import ma.security.Authority
import ma.security.User
import ma.security.UserAuthority
import ma.security.Requestmap
import ma.storage.Attachment

/**
 * This class is responsible do some initialization stuff
 *
 * @since 0.1.0
 */
class BootStrap {

    /**
     * Allowed URL patterns by default
     *
     * @since 0.1.0
     */
    static MAPPINGS = [
        '/error',
        '/**/favicon.ico',
        '/shutdown',
        '/assets/**',
        '/**/js/**',
        '/**/css/**',
        '/**/images/**',
        '/login',
        '/login.*',
        '/login/*',
        '/logout',
        '/logout.*',
        '/logout/*'
    ]

    def springSecurityService
    def importCsvService

    def init = { servletContext ->
        for (String url in MAPPINGS) {
            new Requestmap(url: url, configAttribute: 'permitAll').save()
        }

        new Requestmap(url: '/',              configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/storage/**',    configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/h2-console/**', configAttribute: 'ROLE_ADMIN').save()
        new Requestmap(url: '/profile/**',    configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/**',      configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/role/**', configAttribute: 'ROLE_SUPERVISOR').save()
        new Requestmap(url: '/user/**', configAttribute: 'ROLE_ADMIN,ROLE_SUPERVISOR').save()
        new Requestmap(url: '/login/impersonate', configAttribute: 'ROLE_SWITCH_USER,isFullyAuthenticated()').save()

        createAdminUser()
        createSimpleUser()

        importCsvService.loadInitialData()
        springSecurityService.clearCachedRequestmaps()
    }

    private void createAdminUser() {
        File file = new File('grails-app/assets/images/default_user.jpg')
        Attachment photo = new Attachment(filename: 'photo2.jpg', fileStream: file.newInputStream())
        User admin = new User(name: 'Peter Kronos', username: 'admin', password: 'admin', photo: photo).save(failOnError: true)
        Authority authority = new Authority(authority: 'ROLE_ADMIN').save()

        UserAuthority.create(admin, authority)
    }

    private void createSimpleUser() {
        (0..100).each { number ->
            User john = new User(name: "user${number}", username: "user${number}@kaleidos.net", password: 'password').save(failOnError: true)
            Authority user = new Authority(authority: 'ROLE_USER').save()

            UserAuthority.create(john, user)
        }
    }

    def destroy = {
    }
}
