package ma

/**
 * Responsible for mapping URLs to controllers/resources
 *
 * @since 0.1.0
 */
class UrlMappings {

    static mappings = {

        /**
         * WEB SCAFFOLDING
         */

        "/process/$person/$project/create"(controller: 'process', action: 'create')

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
        '/login/authfail'(view: '/login/auth')

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
    }
}
