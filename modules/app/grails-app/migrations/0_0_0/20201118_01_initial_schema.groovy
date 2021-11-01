import grails.util.Holders

databaseChangeLog = {
    changeSet(author: "mario (generated)", id: "20201118_01") {
        comment "adds initial schema"

        createSequence(incrementBy: "1", sequenceName: "hibernate_sequence", startValue: "1")

        createTable(tableName: "app_user") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "app_userPK")
            }

            column(name: "password_expired", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "username", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "photo_id", type: "BIGINT")

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "account_locked", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "password", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "account_expired", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "enabled", type: "BOOLEAN") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "attachment") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "attachmentPK")
            }

            column(name: "file_path", type: "VARCHAR(255)")

            column(name: "file_size", type: "BIGINT")

            column(name: "original_filename", type: "VARCHAR(255)")

            column(name: "filename", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "content_type", type: "VARCHAR(255)")
        }

        createTable(tableName: "authority") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "authorityPK")
            }

            column(name: "authority", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "came_from") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "came_fromPK")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "country") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "countryPK")
            }

            column(name: "code", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "document_type") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "document_typePK")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "genre") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "genrePK")
            }

            column(name: "code", type: "VARCHAR(255)")

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "person") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "personPK")
            }

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "other_resources_case", type: "VARCHAR(255)")

            column(name: "postal_code", type: "VARCHAR(255)")

            column(name: "region_of_birth", type: "VARCHAR(255)")

            column(name: "caf_case", type: "VARCHAR(255)")

            column(name: "allergies", type: "VARCHAR(255)")

            column(name: "has_primary_attention_file", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "studies_center", type: "VARCHAR(255)")

            column(name: "nationality_id", type: "BIGINT")

            column(name: "street_type", type: "VARCHAR(255)")

            column(name: "genre_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "contact1", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "contact2", type: "VARCHAR(255)")

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "number", type: "INT")

            column(name: "ladder", type: "VARCHAR(255)")

            column(name: "professional_reference_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "first_surname", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "came_from_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "medication", type: "VARCHAR(255)")

            column(name: "came_from_alternative", type: "VARCHAR(255)")

            column(name: "center", type: "VARCHAR(255)")

            column(name: "professional_status", type: "VARCHAR(255)")

            column(name: "birth_date", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "studies_level", type: "VARCHAR(255)")

            column(name: "door", type: "VARCHAR(255)")

            column(name: "professional_background", type: "VARCHAR(255)")

            column(name: "social_worker", type: "VARCHAR(255)")

            column(name: "active", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "district", type: "VARCHAR(255)")

            column(name: "street", type: "VARCHAR(255)")

            column(name: "etmf_case", type: "VARCHAR(255)")

            column(name: "neighborhood", type: "VARCHAR(255)")

            column(name: "has_other_resources_case", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "contact3", type: "VARCHAR(255)")

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "registration_at", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "illnesses", type: "VARCHAR(255)")

            column(name: "cultural_upbringing_id", type: "BIGINT")

            column(name: "photo_id", type: "BIGINT")

            column(name: "has_cai_file", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "document_type_id", type: "BIGINT")

            column(name: "deletion_motivation", type: "VARCHAR(255)")

            column(name: "deleted_at", type: "timestamp")

            column(name: "second_surname", type: "VARCHAR(255)")

            column(name: "floor", type: "VARCHAR(255)")

            column(name: "identification", type: "VARCHAR(255)")
        }

        createTable(tableName: "person_authorization") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "person_authorizationPK")
            }

            column(name: "attachment_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "person_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "project_id", type: "BIGINT")
        }

        createTable(tableName: "person_projects") {
            column(name: "project_id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "person_id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }
        }

        createTable(tableName: "process") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "processPK")
            }

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "content", type: "CLOB") {
                constraints(nullable: "false")
            }

            column(name: "meeting_date", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "person_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "type_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "project_id", type: "BIGINT") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "process_attachment") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "process_attachmentPK")
            }

            column(name: "attachment_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "process_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "process_type") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "process_typePK")
            }

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)")
        }

        createTable(tableName: "project") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "projectPK")
            }

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)")
        }

        createTable(tableName: "relationship") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "relationshipPK")
            }

            column(name: "person_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "relationship_person") {
            column(name: "relationship_persons_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "person_id", type: "BIGINT")
        }

        createTable(tableName: "requestmap") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "requestmapPK")
            }

            column(name: "http_method", type: "VARCHAR(255)")

            column(name: "config_attribute", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "url", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }

        createTable(tableName: "user_authority") {
            column(name: "person_id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "user_authorityPK")
            }

            column(name: "authority_id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "user_authorityPK")
            }
        }

        addUniqueConstraint(columnNames: "username", constraintName: "UC_APP_USERUSERNAME_COL", tableName: "app_user")
        addUniqueConstraint(columnNames: "authority", constraintName: "UC_AUTHORITYAUTHORITY_COL", tableName: "authority")
        addUniqueConstraint(columnNames: "http_method, url", constraintName: "UK3d11b687954e6645e90db4e23cb4", tableName: "requestmap")
        addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "user_authority", constraintName: "FK20xenbeyxxe0w88jtwteh3q94", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "relationship", constraintName: "FK2cnsaylcofgm18v2dl5yludq9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "photo_id", baseTableName: "app_user", constraintName: "FK4ac882e7heyhk4m1hlf4m5jg2", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "attachment", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "person_authorization", constraintName: "FK4ou6iuwjmiwn1j10eftfl0dxf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "process_id", baseTableName: "process_attachment", constraintName: "FK704nxgpfp1j8sp41iijhp3473", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "process", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "relationship_persons_id", baseTableName: "relationship_person", constraintName: "FK7n6odbt8nq721oklrfc2x0d6d", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "relationship", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "genre_id", baseTableName: "person", constraintName: "FK7vtlm9hm06otmnos2c1g9fbeq", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "genre", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "nationality_id", baseTableName: "person", constraintName: "FK9xke7g71eolxbk8gxk08g0ilq", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "country", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "project_id", baseTableName: "process", constraintName: "FKapeehunit1njtnheu53dfg39p", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "project", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "attachment_id", baseTableName: "process_attachment", constraintName: "FKcmusrpvw13tdyxilbfku10l53", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "attachment", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "project_id", baseTableName: "person_authorization", constraintName: "FKd3l4obncyp7a2si4ddxhekifq", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "project", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "type_id", baseTableName: "process", constraintName: "FKdq08mv2e6bce73hibggyokv1b", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "process_type", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "came_from_id", baseTableName: "person", constraintName: "FKeenwfooqsswennj7o2ef3a3j6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "came_from", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "cultural_upbringing_id", baseTableName: "person", constraintName: "FKf8e43yy35hrqnmcn46hvjteyj", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "country", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "professional_reference_id", baseTableName: "person", constraintName: "FKfpfvorned2thw2ya210kco5gf", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "app_user", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "authority_id", baseTableName: "user_authority", constraintName: "FKgvxjs381k6f48d5d2yi11uh89", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authority", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "person_projects", constraintName: "FKht1u3mxmu304yf2pta0tj3bn4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "document_type_id", baseTableName: "person", constraintName: "FKjub676u03pe62eth6ps1dvdty", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "document_type", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "photo_id", baseTableName: "person", constraintName: "FKmftw92lmgm9mlxqgi48ftadjt", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "attachment", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "process", constraintName: "FKomtuxdghjl4rqotar0xwcix4v", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "project_id", baseTableName: "person_projects", constraintName: "FKqr7q258ngbg5hs1yqytnss8nv", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "project", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "attachment_id", baseTableName: "person_authorization", constraintName: "FKry4mjyj6nnjw1ypgehf5sgy2w", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "attachment", validate: "true")
        addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "relationship_person", constraintName: "FKs2n95oxc93vevlf172j5e0eh8", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "person", validate: "true")
    }
}
