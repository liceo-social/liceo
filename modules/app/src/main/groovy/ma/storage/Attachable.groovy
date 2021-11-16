package ma.storage

/**
 * An attachable object has an {@link Attachment} and
 * a description describing what the attachment contains
 *
 * @since 0.1.0
 */
trait Attachable {

    /**
     * Describes the content of the file
     *
     * @since 0.1.0
     */
    String description

    /**
     * File
     *
     * @since 0.1.0
     */
    Attachment attachment
}
