package ma.process

import ma.Process
import ma.storage.Attachment

class ProcessAttachmentCreation implements grails.validation.Validateable {
    Process process
    Attachment attachment

    static constraints = {
        process nullable: true
        attachment nullable: true
    }
}

