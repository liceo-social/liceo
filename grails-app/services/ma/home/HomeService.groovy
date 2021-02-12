package ma.home

import grails.plugin.springsecurity.SpringSecurityService
import ma.Person
import ma.Process
import ma.Project
import ma.security.User

class HomeService {

  SpringSecurityService springSecurityService

  def getStatistics() {
    def currentUser = springSecurityService.currentUser
    def params = [max: 8, sort: 'dateCreated', order: 'desc']

    def addedPeople = Person.list(params)
    def addedPeopleCount = Person.count()
    def addedActivePeopleCount = Person.countByActive(true)

    def assignedPeople = Person.createCriteria().list(params) {
      eq('professionalReference', currentUser)
    }

    def assignedPeopleCount = Person.createCriteria().count {
      eq('professionalReference', currentUser)
    }

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
}
