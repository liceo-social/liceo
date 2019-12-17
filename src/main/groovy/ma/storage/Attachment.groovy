package ma.storage

import grails.util.Holders

/**
 * Represents a file attached to any other domain class
 *
 * @since 0.1.0
 */
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
        Map<String, String> options = Holders.getConfig()?.storage
        Config config = new Config(options)
        filePath = Utils.save(this)

        return true
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
        filePath nullable: true
    }
}