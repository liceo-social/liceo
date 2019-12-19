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
        new Requestmap(url: '/admin/**',      configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/admin/role/**', configAttribute: 'ROLE_SUPERVISOR').save()
        new Requestmap(url: '/admin/user/**', configAttribute: 'ROLE_ADMIN,ROLE_SUPERVISOR').save()
        new Requestmap(url: '/login/impersonate', configAttribute: 'ROLE_SWITCH_USER,isFullyAuthenticated()').save()

        createAdminUser()
        createSimpleUser()
        createGenres()
        createCameFrom()
        createCountries()
        createDocumentTypes()

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
        // File file = new File('grails-app/assets/images/user7-128x128.jpg')
        // Attachment photo = new Attachment(filename: 'photo3.jpg', fileStream: file.newInputStream())
        (0..100).each { number ->
            User john = new User(name: "user${number}", username: "user${number}@kaleidos.net", password: 'password').save(failOnError: true)
            Authority user = new Authority(authority: 'ROLE_USER').save()

            UserAuthority.create(john, user)
        }
        //User john = new User(name: 'Jane Doe', username: 'jane@kaleidos.net', password: 'jane', photo: photo).save(failOnError: true)
        //Authority user = new Authority(authority: 'ROLE_USER').save()

        //UserAuthority.create(john, user)
    }

    private void createGenres() {
        ['Hombre', 'Mujer'].each { String name ->
            new Genre(name: name).save()
        }
    }

    private void createCameFrom() {
        ['Servicios Sociales', 'Colegio'].each { String name ->
            new CameFrom(name: name).save()
        }
    }

    private void createCountries() {
        ['Spain', 'France'].each { String name ->
            new Country(name: name).save()
        }
    }

    private void createDocumentTypes() {
        ['DNI', 'Passport'].each { String name ->
            new DocumentType(name: name).save()
        }
    }

    def destroy = {
    }
}
