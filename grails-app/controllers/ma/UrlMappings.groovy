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
        group "/admin", {
            "/process/$person/$project/create"(controller: 'process', action: 'create')

            "/$controller/$action?/$id?"{
                constraints {
                    // apply constraints here

                }
            }
        }

        /**
         * HOME
         */
        '/'(controller: 'person')

        /**
         * LOGIN
         */
        '/login/auth'(controller: 'login', action: 'auth')
        '/login/authfail'(view: '/login/auth')

        /**
         * FILES
         */
        "/storage/$file"(controller: 'storage', action: 'serve')

        /**
         * HTTP ERRORS
         */
        "/error"(view: '/error')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
