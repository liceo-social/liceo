databaseChangeLog = {

  changeSet(author: "mario (generated)", id: "1636494037200-10") {
    addColumn(tableName: "person") {
      column(name: "deletion_requested_by_id", type: "BIGINT") {
        constraints(nullable: "true")
      }
    }
    addColumn("tableName": "person") {
      column(name: "deletion_approved_by_id", type: "BIGINT") {
        constraints(nullable: "true")
      }
    }
  }

  changeSet(author: "mario (generated)", id: "1636494037200-28") {
    addForeignKeyConstraint(baseColumnNames: "deletion_requested_by_id", baseTableName: "person", constraintName: "FK42ddc1t4f230obfjysatapg73", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
  }

  changeSet(author: "mario (generated)", id: "1636494037200-33") {
    addForeignKeyConstraint(baseColumnNames: "deletion_approved_by_id", baseTableName: "person", constraintName: "FK59sey9yk6gbro7p3si9sn0vbv", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
  }

  changeSet(author: "mario (generated)", id: "1636494636092-6") {
    createTable(tableName: "deactivation_request_entity") {
      column(autoIncrement: "true", name: "id", type: "BIGINT") {
        constraints(primaryKey: "true", primaryKeyName: "deactivation_request_entityPK")
      }
      column(name: "person_id", type: "BIGINT") {
        constraints(nullable: "false")
      }
      column(name: "requested_by_id", type: "BIGINT") {
        constraints(nullable: "false")
      }
      column(name: "motivation", type: "TEXT") {
        constraints(nullable: "false")
      }
    }
  }

  changeSet(author: "mario (generated)", id: "1636494636092-60") {
    addForeignKeyConstraint(baseColumnNames: "requested_by_id", baseTableName: "deactivation_request_entity", constraintName: "FKmju846n9u2vfbln5tymvktm5o", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
  }

  changeSet(author: "mario (generated)", id: "1636494636092-50") {
    addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "deactivation_request_entity", constraintName: "FKgkqh7cefk7wsv6pqbj1nq3w7a", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
  }
}
