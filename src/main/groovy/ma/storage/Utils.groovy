package ma.storage

import grails.util.Holders
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

/**
 * Utility functions to handle {@link Attachment} persistence
 *
 * @since 0.1.0
 */
@Slf4j
@CompileStatic
class Utils {

    /**
     * Saves the content of a given {@link Attachment}
     *
     * @param attachment attachment to persist in file system
     * @return the logical path where the attachment can be found
     * @since 0.1.0
     */
    static String save(Attachment attachment) {
        Map storage = Holders.config?.storage as Map
        String storagePath = storage.storagePath?.toString()
        Path target = Paths.get(storagePath, attachment.filename)

        if (target.toFile().exists()) {
            return target.toString()
        }

        log.debug("creating file at: $target")

        Files.createDirectories(target.parent)
        Files.copy(attachment.fileStream, target)

        return target.toString()
    }

    /**
     * Looks for a given file in a given logical directory
     *
     * @param file file to look for
     * @return file found or null otherwise
     * @since 0.1.0
     */
    static File lookup(String file) {
        Map storage = Holders.config?.storage as Map
        String storagePath = storage.storagePath?.toString()
        File lookupFile = Paths.get(storagePath, file).toFile()

        log.debug("serving file $lookupFile")

        return lookupFile
    }
}
