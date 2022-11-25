databaseChangeLog = {
  changeSet(author: 'Mario', id: '0.5.3-manual-01') {
    addColumn(tableName: "deactivation_request_entity") {
      column(name: "deactivation_date", type: "timestamp") {
        constraints(nullable: "true")
      }
    }
  }
}
