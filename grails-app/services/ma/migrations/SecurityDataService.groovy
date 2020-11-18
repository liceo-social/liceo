package ma.migrations

import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j

import ma.security.Authority
import ma.security.User
import ma.security.UserAuthority
import ma.security.Requestmap

@Slf4j
@Transactional
class SecurityDataService {

     /**
     * Allowed URL patterns by default
     *
     * @since 0.1.0
     */
    static MAPPINGS = [
        '/error',
        '/index',
        '/index.gsp',
        '/**/favicon.ico',
        '/shutdown',
        '/assets/**',
        '/**/js/**',
        '/**/css/**',
        '/**/images/**',
        '/login',
        '/login.*',
        '/login/**',
        '/logout',
        '/logout.*',
        '/logout/**'
    ]

    def application
    def springSecurityService

    void load() {
        this.loadRequestmaps()
        this.completeAdminUser(this.createAdminUser())
        this.clearRequestMapCache()
    }

    void loadRequestmaps() {
        // check to avoid inserting request maps twice
        if (Requestmap.count() > 0) {
            log.debug "skipping loading request maps"
            return
        }

        log.debug "loading requestmaps"
        for (String url in MAPPINGS) {
            new Requestmap(url: url, configAttribute: 'permitAll').save(flush: true)
        }

        new Requestmap(url: '/storage/**',        configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/h2-console/**',     configAttribute: 'ROLE_ADMIN').save()
        new Requestmap(url: '/profile/**',        configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/role/**',           configAttribute: 'ROLE_SUPERVISOR').save()
        new Requestmap(url: '/user/show/**',      configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/user/**',           configAttribute: 'ROLE_ADMIN,ROLE_SUPERVISOR').save()
        new Requestmap(url: '/login/impersonate', configAttribute: 'ROLE_SWITCH_USER,isFullyAuthenticated()').save()
        new Requestmap(url: '/',                  configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
        new Requestmap(url: '/**',                configAttribute: 'ROLE_USER,ROLE_ADMIN').save()
    }

    User createAdminUser() {
        // check to avoid inserting admin user twice
        if (User.findByUsername('admin')) {
            log.debug "skipping creating admin user"
            return
        }

        log.debug "creating admin user"
        Map config = application.config.admin
        User admin = new User(
            name: config.name,
            username: config.username,
            password: config.password
        ).save(failOnError: true, flush: true)

        return admin
    }

    void completeAdminUser(User admin) {
        if (Authority.findByAuthority('ROLE_ADMIN')) {
            log.debug "skipping creating authority"
            return
        }

        log.debug "creating admin authority"
        Authority authority = new Authority(authority: 'ROLE_ADMIN').save()
        Authority normalUser = new Authority(authority: 'ROLE_USER').save()
        UserAuthority.create(admin, authority)
    }

    void clearRequestMapCache() {
        log.debug "clearing previous cached request maps"
        springSecurityService.clearCachedRequestmaps()
    }
}
