package ma.storage

import grails.util.Holders
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardCopyOption
import java.security.MessageDigest

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
    static File save(Attachment attachment) {
        Map storage = Holders.config?.storage as Map
        String ext = extractExtension(attachment.filename)
        Path tmp = createTemporalFileWithExtension(attachment, ext)

        String md5 = toMD5(tmp.toFile().bytes)
        Path target = Paths.get("${storage?.storagePath}", "${md5}${ext}")

        log.debug "creating file at: $target"

        if (target.toFile().exists()) {
            return target.toFile()
        }

        Files.createDirectories(target.parent)
        Files.move(tmp, target)

        return target.toFile()
    }

    static Path createTemporalFileWithExtension(Attachment attachment, String extension) {
        Path temporalPath = Files.createTempFile("", extension)

        Files.copy(
            attachment.fileStream,
            temporalPath,
            StandardCopyOption.REPLACE_EXISTING
        )

        return temporalPath
    }

    static String extractExtension(String filename) {
        String extension = Optional
            .ofNullable(filename)
            .filter { f -> f.contains(".") }
            .map { f -> f.substring(filename.lastIndexOf(".") + 1) }
            .orElse("")

        return ".$extension"
    }

    static String toMD5(byte[] bytes) {
        return MessageDigest
            .getInstance("MD5")
            .digest(bytes)
            .encodeHex()
            .toString()
    }

    /**
     * Looks for a given file in a given logical directory
     *
     * @param attachment which contains the file path
     * @return file found or null otherwise
     * @since 0.1.0
     */
    static File lookup(Attachment attachment) {
        return new File(attachment?.filePath)
    }
}
