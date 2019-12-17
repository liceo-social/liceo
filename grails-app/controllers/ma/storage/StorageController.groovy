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
     * @param file file name
     * @return serves a file
     * @since 0.1.0
     */
    def serve(String file) {
        File sourceFile = Utils.lookup(file)

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
}
