databaseChangeLog = {

    changeSet(author: "mario (generated)", id: "1607117775350-15") {
        comment "fix social services database model"

        addColumn(tableName: "person") {
            column(name: "cai_case", type: "varchar(255)") {
                constraints(nullable: "true")
            }
        }

        addColumn(tableName: "person") {
            column(name: "has_caf_case", type: "boolean") {
                constraints(nullable: "false")
            }
        }

        addColumn(tableName: "person") {
            column(name: "has_etmf_case", type: "boolean") {
                constraints(nullable: "false")
            }
        }

        dropColumn(columnName: "caf_case", tableName: "person")
        dropColumn(columnName: "etmf_case", tableName: "person")
        dropColumn(columnName: "has_cai_file", tableName: "person")
    }
}
