package ma.person

import grails.validation.Validateable
import groovy.transform.ToString
import ma.Project
import ma.security.User

import java.sql.Date
import java.time.LocalDate
import java.time.temporal.ChronoUnit

import static java.time.temporal.TemporalAdjusters.firstDayOfYear
import static java.time.temporal.TemporalAdjusters.lastDayOfYear

/**
 * Command responsible for searching people following
 * a series of constraints
 *
 * @since 0.2.0
 */
@ToString
class SearchCommand implements Validateable {
  String name
  Integer max
  Integer offset

  Integer minAge
  Integer maxAge
  Boolean showOnlyActive

  List<Genre> genres
  List<Sex> sexes
  List<Country> countries

  List<CameFrom> cameFrom
  List<Project> projects
  List<User> handlers

  String sort
  String order

  Date getMinDate() {
    return minAge ? Date.valueOf(LocalDate.now().minus(minAge, ChronoUnit.YEARS).with(lastDayOfYear())) : null
  }

  Date getMaxDate() {
    return maxAge ? Date.valueOf(LocalDate.now().minus(maxAge, ChronoUnit.YEARS).with(firstDayOfYear())) : null
  }

  static constraints = {
    name nullable: true
  }
}
