package ma

import ma.storage.Attachment

class ProcessAttachment {

    static belongsTo = [process: Process]

    String description
    Attachment attachment

    static constraints = {
        description nullable: false
        attachment validator: { val, obj ->
            if (!obj.id && !val) {
                return "attachment required"
            }
        }
    }

    static mapping = {
        attachment cascade: 'all-delete-orphan'
    }
}
