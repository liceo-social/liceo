package ma

import grails.plugin.springsecurity.SpringSecurityService
import ma.Person
import ma.home.HomeService

/**
 *
 * @since 0.1.0
 */
class HomeController {

    HomeService homeService

    def index() {
      def statistics = homeService.statistics

        return [
            statistics: statistics
        ]
    }
}
