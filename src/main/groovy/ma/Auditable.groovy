package ma

/**
 * Classes implementing Auditable will contain when
 * they have been created and last time they've benn
 * updated
 *
 * @since 0.1.0
 */
trait Auditable {

    /**
     * When the record has been created
     *
     * @since 0.1.0
     */
    Date dateCreated

    /**
     * The last time the record has been updated
     *
     * @since 0.1.0
     */
    Date lastUpdated
}
