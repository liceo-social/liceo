package ma

import ma.storage.Attachment

/**
 * Tags responsible for rendering files
 *
 * @since 0.1.0
 */
class StorageTagLib {

    /**
     * Tag library namespace
     *
     * @since 0.1.0
     */
    static namespace = 'storage'

    /**
     * Resolves a given file from an instance of type {@link Attachment}
     * @since 0.1.0
     */
    def resolve = { attrs, body ->
        Attachment attachment = attrs.attachment

        out << "/storage/${attachment?.filename}"
    }

}
