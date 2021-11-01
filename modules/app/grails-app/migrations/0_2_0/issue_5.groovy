import grails.util.Holders

databaseChangeLog = {

    changeSet(author: "mario (generated)", id: "1607557129618-15") {
        addColumn(tableName: "project") {
            column(name: "code", type: "varchar(255)")
        }
    }

    changeSet(author: "mario", id: "1607557129618-16") {
      comment "fills up every empty acronym"

      grailsChange {
        change {
          Holders.applicationContext.getBean("issue5Service").load()
        }
      }
    }
}
