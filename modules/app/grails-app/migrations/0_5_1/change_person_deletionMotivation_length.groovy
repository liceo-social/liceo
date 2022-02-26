databaseChangeLog = {
  changeSet(author: 'Mario', id: '0.5.1-manual-01') {
    comment { 'fixes #' }
    modifyDataType(tableName: 'person', columnName: 'deletion_motivation', newDataType: 'text')
  }
}
