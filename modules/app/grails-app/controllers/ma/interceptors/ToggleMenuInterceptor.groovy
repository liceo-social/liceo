package ma.interceptors

import grails.artefact.Interceptor

/**
 * Handles the state of the application's sidebar
 *
 * @since 0.1.0
 */
@SuppressWarnings("unused")
class ToggleMenuInterceptor implements Interceptor {
    ToggleMenuInterceptor() {
        matchAll()
            .except(uri:'/error')
            .except(controller: 'storage')
            .except(controller: 'attachment')
    }

    boolean after() {
        if (params.toggle == 'close') {
            session.toggle = 'sidebar-collapse'
        }

        if (params.toggle == 'open') {
            session.toggle = ''
        }

        return true
    }
}
