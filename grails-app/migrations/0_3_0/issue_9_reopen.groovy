databaseChangeLog = {

  changeSet(author: "mario (generated)", id: "1607117775350-15") {
    comment "fix social services database model"

    addColumn(tableName: "person") {
      column(name: "has_cai_case", type: "boolean", defaultValue: "false") {
        constraints(nullable: "false")
      }
    }

    dropColumn(columnName: "cai_case", tableName: "person")
  }
}
