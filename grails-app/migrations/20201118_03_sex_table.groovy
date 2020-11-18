import grails.util.Holders

databaseChangeLog = {
  changeSet(author: 'Mario Garcia', id: '20201118_03_A') {
    comment "adds sex table"

    createTable(tableName: "sex") {
      column(autoIncrement: "true", name: "id", type: "BIGINT") {
        constraints(primaryKey: "true", primaryKeyName: "sexPK")
      }
      column(name: "code", type: "VARCHAR(255)")
      column(name: "name", type: "VARCHAR(255)") {
        constraints(nullable: "false")
      }
    }

    addColumn(tableName: 'person') {
      column(name: "sex_id", type: "BIGINT") {
        constraints(nullable: "true")
      }
    }
  }

  changeSet(author: "Mario Garcia", id: "20201118_03_B") {
    comment "loads sex table master data"

    grailsChange {
      change {
        Holders.applicationContext.getBean("sexMigrationService").load()
      }
    }
  }

  changeSet(author: 'Mario Garcia', id: '20201118_03_C') {
    comment "adds sex field constrains in person table"

    addNotNullConstraint(tableName: 'person', columnName: 'sex_id')
    addForeignKeyConstraint(
      baseColumnNames: "sex_id",
      baseTableName: "person",
      constraintName: "FK745xp50eybgnif9scwj2t1cr9",
      deferrable: "false",
      initiallyDeferred: "false",
      referencedColumnNames: "id",
      referencedTableName: "sex",
      validate: "true")
  }
}
