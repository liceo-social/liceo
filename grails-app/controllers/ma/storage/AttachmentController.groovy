package ma.storage


class AttachmentController {

    /**
     * Downloads a given attachment
     *
     * @since 0.1.0
     */

    def download(Long id) {
        Attachment attachment = Attachment.get(id)
        File sourceFile = Utils.lookup(attachment.filename)

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
        response.setHeader('Content-Disposition', /attachment; filename="${attachment.filename}"/)
        response.outputStream << sourceFile.bytes
        response.flushBuffer()
    }
}
