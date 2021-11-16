package ma.authorization

import ma.Authorization
import ma.Project
import ma.attachment.UpdateAttachmentCommand

class UpdateAuthorizationAttachmentCommand implements UpdateAttachmentCommand {

    Project project
    Authorization authorization

    static constraints = {
        description nullable: false, blank: false
        attachment nullable: true
        project nullable: true
        authorization nullable: false
    }
}
