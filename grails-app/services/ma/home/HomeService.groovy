package ma.home

import grails.plugin.springsecurity.SpringSecurityService
import groovy.sql.Sql
import ma.Person
import ma.Process
import ma.Project
import ma.security.User

import javax.sql.DataSource

class HomeService {

  static final SQL_MOST_VULNERABLE = """
  SELECT
    y.person_id
  FROM
    (SELECT
      MAX(person_id) as person_id ,
      SUM(notes) as notes,
      SUM(warnings) as warnings ,
      SUM(dangers) as dangers
    FROM (
      SELECT
        count(*) as notes,
        0 as warnings,
        0 as dangers,
        n.person_id as person_id
      FROM note n WHERE n.severity = 'NOTE' AND n.resolution_date IS NULL group by n.person_id
      UNION ALL
      SELECT
        0 as notes,
        count(*) as warnings,
        0 as dangers,
        n.person_id as person_id
      FROM note n WHERE n.severity = 'WARNING' AND n.resolution_date IS NULL GROUP BY n.person_id
      UNION ALL
      SELECT
        0 as notes,
        0 as warnings,
        count(*) as dangers,
        n.person_id as person_id
      FROM note n WHERE n.severity = 'DANGER' AND n.resolution_date IS NULL group by n.person_id
      UNION ALL
      SELECT
        0 as notes,
        0 as warnings,
        0 as dangers,
        p.id as person_id
      FROM person p LEFT JOIN note n on n.person_id = p.id
    ) as x
    GROUP BY x.person_id) as y
  JOIN person p ON
    p.id = y.person_id
  WHERE
    (p.professional_reference_id = :professional AND p.professional_reference_id IS NOT NULL) OR
    (p.professional_reference_id IS NOT NULL AND CAST(:professional as INTEGER) IS NULL)
  ORDER BY y.dangers desc, y.warnings desc, y.notes desc
  LIMIT 8
  """

  SpringSecurityService springSecurityService
  DataSource dataSource

  def getStatistics() {
    def currentUser = springSecurityService.currentUser
    def addedPeopleCount = Person.count()
    def addedActivePeopleCount = Person.countByActive(true)
    def assignedPeopleCount = Person.createCriteria().count {
      eq('professionalReference', currentUser)
    }

    def addedPeople = this.getMostVulnerablePeople()
    def assignedPeople = this.getMostVulnerablePeople(currentUser)

    return [
      currentUser: currentUser,
      addedPeopleCount: addedPeopleCount,
      addedActivePeopleCount: addedActivePeopleCount,
      addedPeople: addedPeople,
      assignedPeople: assignedPeople,
      assignedPeopleCount: assignedPeopleCount,
      projectsCount: Project.count(),
      processesCount: Process.count()
    ]
  }

  List<Person> getMostVulnerablePeople(User user) {
    def peopleIds = this.getVulnerablePeopleIds(user)

    if (peopleIds) {
      return Person.findAllByIdInList(peopleIds).sort { p ->
        peopleIds.indexOf(p.id)
      }
    } else {
      return []
    }
  }

  List<Serializable> getVulnerablePeopleIds(User user){
    return new Sql(dataSource)
      .rows(SQL_MOST_VULNERABLE, [professional: user?.id])
      *.person_id
  }
}
