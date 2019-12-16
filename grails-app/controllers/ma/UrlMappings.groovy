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
            "/$controller/$action?/$id?"{
                constraints {
                    // apply constraints here

                }
            }
        }

        '/'(controller: 'home')
        '/login/auth'(controller: 'login', action: 'auth')
        '/login/authfail'(view: '/login/auth')

        "/error"(view: '/error')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
