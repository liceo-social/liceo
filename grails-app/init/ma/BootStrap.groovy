package ma

import ma.security.User

/**
 * This class is responsible do some initialization stuff
 *
 * @since 0.1.0
 */
class BootStrap {

    /**
     * Reference to the Grails' application
     *
     * @since 0.1.0
     */
    def application

    /**
     * Service to load csv files
     *
     * @since 0.1.0
     */
    def importCsvService

    /**
     * Service to load initial security data
     *
     * @since 0.1.0
     */
    def securityDataService

    /**
     * Executes initial tasks at startup
     *
     * @since 0.1.0
     */
    def init = { servletContext ->
        securityDataService.loadInitialData()
        importCsvService.loadInitialData()
    }

    /**
     * Executes clean up tasks at shutdown
     *
     * @since 0.1.0
     */
    def destroy = { }
}
