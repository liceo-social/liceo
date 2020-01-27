package ma

import static com.xlson.groovycsv.CsvParser.parseCsv

import org.springframework.core.io.ClassPathResource
import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j
import ma.person.Country
import ma.person.Genre

@Slf4j
@Transactional
class ImportCsvService {

    private static final String GENRES_CSV_FILE = "/csv/genres.csv"
    private static final String COUNTRIES_CSV_FILE = "/csv/countries.csv"

    /**
     * Process loading initial master data
     *
     * @since 0.1.0
     */
    @Transactional
    def loadInitialData() {
        log.debug 'loading master data ...'

        try {
            loadGenres()
            loadCountries()
        } catch (Throwable th) {
            log.error("error while loading csv master data", th)
        }
    }

    void loadGenres() {
        if (Genre.count() > 0) {
            log.debug "skipping loading genre list"
            return
        }

        log.debug "loading genre list"
        def csv = new ClassPathResource(GENRES_CSV_FILE)
            .inputStream
            .getText('UTF-8')

        def genres = parseCsv(csv)

        genres.each { genre ->
            new Genre(name: genre.name, code: genre.code).save(failOnError: true)
        }
    }

    void loadCountries() {
        if (Country.count() > 0) {
            log.debug "skipping loading country list"
            return
        }

        log.debug "loading iso country list"
        def csv = new ClassPathResource(COUNTRIES_CSV_FILE)
            .inputStream
            .getText('UTF-8')

        def countries = parseCsv(csv)

        countries.each { country ->
            new Country(name: country.commonName, code: country.alpha2).save(failOnError: true)
        }
    }
}
