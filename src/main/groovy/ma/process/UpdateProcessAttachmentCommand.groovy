package ma.process

import ma.ProcessAttachment
import ma.attachment.UpdateAttachmentCommand

class UpdateProcessAttachmentCommand implements UpdateAttachmentCommand {

    Long id

    static constraints = {
        description nullable: false, blank: false
        attachment nullable: true
        id nullable: false
    }
}
