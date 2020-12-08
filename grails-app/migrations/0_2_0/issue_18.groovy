import grails.util.Holders

databaseChangeLog = {

    changeSet(author: "mario (generated)", id: "1606923172462-3") {
        comment "adding owner to main entities"

        addColumn(tableName: "person") {
            column(name: "created_by_id", type: "int8") {
                constraints(nullable: "true")
            }
            column(name: "updated_by_id", type: "int8") {
              constraints(nullable: "true")
            }
        }

        addColumn(tableName: "person_authorization") {
            column(name: "created_by_id", type: "int8") {
                constraints(nullable: "true")
            }
            column(name: "updated_by_id", type: "int8") {
              constraints(nullable: "true")
            }
        }

        addColumn(tableName: "process") {
            column(name: "created_by_id", type: "int8") {
                constraints(nullable: "true")
            }
            column(name: "updated_by_id", type: "int8") {
              constraints(nullable: "true")
            }
        }

        addColumn(tableName: "process_type") {
            column(name: "created_by_id", type: "int8") {
                constraints(nullable: "true")
            }
            column(name: "updated_by_id", type: "int8") {
              constraints(nullable: "true")
            }
        }

        addColumn(tableName: "project") {
            column(name: "created_by_id", type: "int8") {
                constraints(nullable: "true")
            }
            column(name: "updated_by_id", type: "int8") {
              constraints(nullable: "true")
            }
        }

        addColumn(tableName: "relationship") {
            column(name: "created_by_id", type: "int8") {
                constraints(nullable: "true")
            }
            column(name: "updated_by_id", type: "int8") {
              constraints(nullable: "true")
            }
        }
    }

    changeSet(author: "mario", id: "1606923172462-9") {
      comment "populates owner field if records don't have any"

      grailsChange {
        change {
          Holders.applicationContext.getBean("createdByMigrationService").load()
        }
      }
    }

    changeSet(author: "mario", id: "1606923172462-10") {
      comment "makes sure now you cannot create a record wo an owner"

      addNotNullConstraint(tableName: 'person', columnName: 'created_by_id', columnDataType: "int8")
      addNotNullConstraint(tableName: 'person', columnName: 'updated_by_id', columnDataType: "int8")

      addNotNullConstraint(tableName: 'person_authorization', columnName: 'created_by_id', columnDataType: "int8")
      addNotNullConstraint(tableName: 'person_authorization', columnName: 'updated_by_id', columnDataType: "int8")

      addNotNullConstraint(tableName: 'process', columnName: 'created_by_id', columnDataType: "int8")
      addNotNullConstraint(tableName: 'process', columnName: 'updated_by_id', columnDataType: "int8")

      addNotNullConstraint(tableName: 'process_type', columnName: 'created_by_id', columnDataType: "int8")
      addNotNullConstraint(tableName: 'process_type', columnName: 'updated_by_id', columnDataType: "int8")

      addNotNullConstraint(tableName: 'project', columnName: 'created_by_id', columnDataType: "int8")
      addNotNullConstraint(tableName: 'project', columnName: 'updated_by_id', columnDataType: "int8")

      addNotNullConstraint(tableName: 'relationship', columnName: 'created_by_id', columnDataType: "int8")
      addNotNullConstraint(tableName: 'relationship', columnName: 'updated_by_id', columnDataType: "int8")
    }

    changeSet(author: "mario (generated)", id: "1606923172462-11") {
      comment "adds foreign keys for created by fields"

      addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "process", constraintName: "FK3p48fyx3ks8h62r3v0b271ftr", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
      addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "process", constraintName: "FK3p48fyx3ks8h62r3v0b271ftu", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")

      addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "project", constraintName: "FK5unoqtfgeumxjj4a5cd59w36c", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
      addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "project", constraintName: "FK5unoqtfgeumxjj4a5cd59w36u", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")

      addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "person_authorization", constraintName: "FK74ohhmfc54ug8t3t721sbaqu0", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
      addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "person_authorization", constraintName: "FK74ohhmfc54ug8t3t721sbaquu", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")

      addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "process_type", constraintName: "FKd7p626g5dtmcef4ajii8m511", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
      addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "process_type", constraintName: "FKd7p626g5dtmcef4ajii8m51u", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")

      addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "person", constraintName: "FKe3sxhiip3iln9duf4tjacu9hl", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
      addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "person", constraintName: "FKe3sxhiip3iln9duf4tjacu9hu", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")

      addForeignKeyConstraint(baseColumnNames: "created_by_id", baseTableName: "relationship", constraintName: "FKeifxj8ghlr3trp6clltcg4ikn", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
      addForeignKeyConstraint(baseColumnNames: "updated_by_id", baseTableName: "relationship", constraintName: "FKeifxj8ghlr3trp6clltcg4iku", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
    }
}
