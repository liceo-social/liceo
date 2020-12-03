import ma.security.AuditableListener
import ma.storage.AttachmentValueConverter
import ma.security.PersonPasswordEncoderListener

beans = {
    attachmentConverter(AttachmentValueConverter)
    personPasswordEncoderListener(PersonPasswordEncoderListener)
    auditableListener(AuditableListener)
}
