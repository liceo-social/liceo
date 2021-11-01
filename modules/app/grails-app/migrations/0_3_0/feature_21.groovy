
databaseChangeLog = {

    changeSet(author: "mario (generated)", id: "1608403985611-15") {
      comment "adding new columns to process"

        addColumn(tableName: "process") {
            column(name: "is_time_auditable", type: "boolean")
        }

        addColumn(tableName: "process") {
          column(name: "all_day", type: "boolean")
        }

        addColumn(tableName: "process") {
          column(name: "meeting_start_time", type: "time")
        }

        addColumn(tableName: "process") {
            column(name: "meeting_end_time", type: "time")
        }
    }

  changeSet(author: "mario", id: "1608403985611-17") {
    comment "setting meeting_start_time/is_time_auditable mandatory"

    addDefaultValue(tableName: 'process', columnName: 'is_time_auditable', defaultValue: '0')
    addNotNullConstraint(tableName: 'process', columnName: 'is_time_auditable', columnDataType:"boolean", defaultNullValue: "0")

    addDefaultValue(tableName: 'process', columnName: 'all_day', defaultValue: '1')
    addNotNullConstraint(tableName: 'process', columnName: 'all_day', columnDataType:"boolean", defaultNullValue: "1")
  }
}
