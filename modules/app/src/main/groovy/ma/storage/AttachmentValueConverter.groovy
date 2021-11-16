package ma.storage

import grails.databinding.converters.ValueConverter
import org.springframework.web.multipart.MultipartFile

class AttachmentValueConverter implements ValueConverter {

    static boolean isNull(value) {
        value == null || 'null' == value
    }

    boolean canConvert(value) {
        value instanceof MultipartFile || isNull(value)
    }

    def convert(value) {
        if (isNull(value) ||
            !(value instanceof MultipartFile) ||
            !((MultipartFile) value).originalFilename ||
            !((MultipartFile) value).inputStream) {
            return null
        }

        new Attachment(
            filename: value.originalFilename,
            contentType: value.contentType,
            originalFilename: value.originalFilename,
            fileSize: value.size,
            fileStream: value.inputStream
        )
    }

    Class<?> getTargetType() {
        return Attachment
    }
}
