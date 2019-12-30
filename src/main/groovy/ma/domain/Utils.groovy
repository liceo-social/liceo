package ma.domain

import java.time.Period
import java.time.LocalDate
import java.time.ZoneId

class Utils {

    static String getAcronym(Object bean, String property) {
        return bean[property]
            .toString()
            .split(" ")
            .collect { it.find()?.toUpperCase() }
            .join("")
    }

    static Integer calculateAge(Date birthDate) {
        LocalDate localDate = birthDate
            .toInstant()
            .atZone(ZoneId.systemDefault())
            .toLocalDate()

        return Period
            .between(localDate, LocalDate.now())
            .getYears();
    }
}