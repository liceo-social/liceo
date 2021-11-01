import grails.util.Holders

databaseChangeLog = {
  changeSet(author: "Mario Garcia", id: "20201118_02_A") {
    comment "loads master data"

    grailsChange {
      change {
        Holders.applicationContext.getBean("masterDataService").load()
      }
    }
  }

  changeSet(author: "Mario Garcia", id: "20201118_02_B") {
    comment "loads security data"

    grailsChange {
      change {
        Holders.applicationContext.getBean("securityDataService").load()
      }
    }
  }
}
