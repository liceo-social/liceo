package ma.storage

/**
 * Serves attachments
 *
 * @since 0.1.0
 */
class StorageController {

    /**
     * Controller action to get files from underlying file system
     *
     * @param id attachment id
     * @return serves a file
     * @since 0.1.0
     */
    def serve(Long id) {
        Attachment attachment = Attachment.get(id)
        File sourceFile = Utils.lookup(attachment)

        /*
         * if file is null or doesn't exist in the file system
         * the controller returns a 404
         */
        if (!(sourceFile && sourceFile.exists())) {
            render status: 404
            return
        }

        /*
         * then the file is served
         */
        response.outputStream << sourceFile.bytes
        response.flushBuffer()
    }

    /**
     * Downloads a given attachment
     *
     * @param id
     * @since 0.1.0
     */

    def download(Long id) {
        Attachment attachment = Attachment.get(id)
        File sourceFile = Utils.lookup(attachment)

        /*
         * if file is null or doesn't exist in the file system
         * the controller returns a 404
         */
        if (!(sourceFile && sourceFile.exists())) {
            render status: 404
            return
        }

        /*
         * then the file is served
         */
        response.setHeader('Content-Transfer-Encoding', 'binary')
        response.setHeader('Content-Disposition', /attachment; filename="${attachment.originalFilename}"/)
        response.outputStream << sourceFile.bytes
        response.flushBuffer()
    }
}
