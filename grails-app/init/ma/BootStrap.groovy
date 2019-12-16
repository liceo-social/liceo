package ma

import ma.security.Authority
import ma.security.Person
import ma.security.PersonAuthority
import ma.security.Requestmap

class BootStrap {

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

    def init = { servletContext ->
        for (String url in MAPPINGS) {
            new Requestmap(url: url, configAttribute: 'permitAll').save()
        }

        new Requestmap(url: '/',              configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/h2-console/**', configAttribute: 'ROLE_ADMIN').save()
        new Requestmap(url: '/profile/**',    configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/admin/**',      configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/admin/role/**', configAttribute: 'ROLE_SUPERVISOR').save()
        new Requestmap(url: '/admin/user/**', configAttribute: 'ROLE_ADMIN,ROLE_SUPERVISOR').save()
        new Requestmap(url: '/login/impersonate', configAttribute: 'ROLE_SWITCH_USER,isFullyAuthenticated()').save()

        createAdminUser()
        createSimpleUser()

        springSecurityService.clearCachedRequestmaps()
    }

    private void createAdminUser() {
        Person admin = new Person(username: 'admin', password: 'admin').save()
        Authority authority = new Authority(authority: 'ROLE_ADMIN').save()

        PersonAuthority.create(admin, authority)
    }

    private void createSimpleUser() {
        Person john = new Person(username: 'john', password: 'john').save()
        Authority user = new Authority(authority: 'ROLE_USER').save()

        PersonAuthority.create(john, user)
    }

    def destroy = {
    }
}
