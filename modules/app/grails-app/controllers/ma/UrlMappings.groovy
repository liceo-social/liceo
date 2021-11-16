package ma

/**
 * Responsible for mapping URLs to controllers/resources
 *
 * @since 0.1.0
 */
class UrlMappings {

    static mappings = {
        group "/process", {
          "/create/$person"(controller: 'process', action: 'create')
          "/export/$person/$project?"(controller: 'process', action: 'export')
        }

        /**
         * WEB SCAFFOLDING
         */
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here

            }
        }

        /**
         * HOME
         */
        '/'(controller: 'home')

        /**
         * LOGIN
         */
        '/login/auth'(controller: 'login', action: 'auth')
        '/logout'(controller: 'logout', action: 'logout')

        '/agenda/'(controller: 'agenda')

        /**
         * FILES
         */
        "/storage/$id"(controller: 'storage', action: 'serve')
        "/attachment/download/$id"(controller: 'storage', action: 'download')

        /**
         * HTTP ERRORS
         */
        "/error"(view: '/error')
        "500"(view:'/error')
        "404"(view:'/notFound')
        "403"(view:'/notAuthorized')
    }
}
