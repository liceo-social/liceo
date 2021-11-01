databaseChangeLog = {

  changeSet(author: "mario (generated)", id: "1612950019636-20") {
    createTable(tableName: "note") {
      column(autoIncrement: "true", name: "id", type: "BIGINT") {
        constraints(primaryKey: "true", primaryKeyName: "notePK")
      }

      column(name: "date_created", type: "TIMESTAMP WITHOUT TIME ZONE") {
        constraints(nullable: "false")
      }

      column(name: "last_updated", type: "TIMESTAMP WITHOUT TIME ZONE") {
        constraints(nullable: "false")
      }

      column(name: "updated_by_id", type: "BIGINT")

      column(name: "severity", type: "VARCHAR(255)") {
        constraints(nullable: "false")
      }

      column(name: "person_id", type: "BIGINT") {
        constraints(nullable: "false")
      }

      column(name: "comment", type: "VARCHAR(255)") {
        constraints(nullable: "false")
      }

      column(name: "created_by_id", type: "BIGINT")
    }
  }

  changeSet(author: "mario (generated)", id: "1612950019636-22") {
    addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "note", constraintName: "FKdhoxi3cn4l2sk1g214r8fn7q0", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
  }

  changeSet(author: "mario (generated)", id: "1612950019636-23") {
    addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "note", constraintName: "FKjjeklubs5df8wm4oh1lbns4e6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
  }

  changeSet(author: "mario (generated)", id: "1612950019636-24") {
    addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "note", constraintName: "FKsphu43pr2cl4v925ijgi6fxfv", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
  }

  changeSet(author: "mario (generated)", id: "1613122068481-20") {
    addColumn(tableName: "note") {
      column(name: "resolution", type: "varchar(255)")
    }
  }

  changeSet(author: "mario (generated)", id: "1613122068481-21") {
    addColumn(tableName: "note") {
      column(name: "resolution_date", type: "timestamp")
    }
  }
}
