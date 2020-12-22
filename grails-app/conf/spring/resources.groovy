import ma.security.AuditableListener
import ma.storage.AttachmentValueConverter
import ma.security.PersonPasswordEncoderListener

beans = {
  xmlns context:"http://www.springframework.org/schema/context"

  context.'component-scan'('base-package': "ma.agenda.application.service")


  attachmentConverter(AttachmentValueConverter)
    personPasswordEncoderListener(PersonPasswordEncoderListener)
    auditableListener(AuditableListener)
}
