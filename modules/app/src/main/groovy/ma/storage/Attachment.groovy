package ma.storage

import grails.gorm.annotation.Entity

/**
 * Represents a file attached to any other domain class
 *
 * @since 0.1.0
 */
 @Entity
class Attachment {

    /**
     * Fields not to be serialized
     *
     * @since 0.1.0
     */
    static transients = ['fileStream']

    /**
     * File name
     *
     * @since 0.1.0
     */
    String filename

    /**
     * Original file name
     *
     * @since 0.1.0
     */
    String originalFilename

    /**
     * File content type
     *
     * @since 0.1.0
     */
    String contentType

    /**
     * File size
     *
     * @since 0.1.0
     */
    long fileSize

    /**
     * Absolute file path
     *
     * @since 0.1.0
     */
    String filePath

    /**
     * Content of the file
     *
     * @since 0.1.0
     */
    InputStream fileStream

    /**
     * This method will be triggered every time this instance is
     * going to be validated by Gorm
     *
     * @return true if validation is correct false otherwise
     * @since 0.1.0
     */
    def beforeValidate() {
        if (!this.filePath && this.fileStream) {
            File file = Utils.save(this)
            this.filePath = file.absolutePath
            this.filename = file.name
        }
    }

    /**
     * Sets the content of the attachment
     *
     * @param inputStream content of the attachment
     * @since 0.1.0
     */
    void setFileStream(InputStream inputStream) {
        this.fileStream = inputStream
    }

    /**
     * Returns the content of the attachment
     *
     * @return the content of the attachment
     * @since 0.1.0
     */
    InputStream getFileStream() {
        return this.fileStream
    }

    /**
     * Validations this entity should follow to
     *
     * @since 0.1.0
     */
    static constraints = {
        filename nullable: false
        originalFilename nullable: true
        contentType nullable: true
        fileSize nullable: true
        filePath nullable: true
    }
}
