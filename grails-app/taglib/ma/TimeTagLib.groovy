package ma

import org.ocpsoft.prettytime.PrettyTime

class TimeTagLib {

    static Locale locale = new Locale("ES")

     /**
     * Tag library namespace
     *
     * @since 0.1.0
     */
    static namespace = 'time'

    /**
     * @since 0.1.0
     */
    def ago = { attrs, body ->
        def prettyTime = new PrettyTime(new Date(), locale)

        out << prettyTime.format(attrs.time)
    }
}
