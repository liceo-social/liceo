package ma.authorization

import ma.Authorization
import ma.attachment.UpdateAttachmentCommand

class UpdateAuthorizationAttachmentCommand implements UpdateAttachmentCommand {

    Authorization authorization

    static constraints = {
        description nullable: false, blank: false
        attachment nullable: true
        authorization nullable: false
    }
}
