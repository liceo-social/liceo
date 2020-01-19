package ma.attachment

import grails.validation.Validateable

import ma.storage.Attachment

trait UpdateAttachmentCommand extends Validateable {

    String description
    Attachment attachment
}
