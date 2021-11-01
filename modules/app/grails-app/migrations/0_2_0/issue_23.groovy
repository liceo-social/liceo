import grails.util.Holders

databaseChangeLog = {
  changeSet(author: "Mario Garcia", id: "20201208_01") {
    comment "adds url mappings for ONLY admin urls"

    grailsChange {
      change {
        Holders.applicationContext.getBean("issue23Service").load()
      }
    }
  }
}
