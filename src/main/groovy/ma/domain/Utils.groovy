package ma.domain

class Utils {

    static String getAcronym(Object bean, String property) {
        return bean[property]
            .toString()
            .split(" ")
            .collect { it.find()?.toUpperCase() }
            .join("")
    }
}