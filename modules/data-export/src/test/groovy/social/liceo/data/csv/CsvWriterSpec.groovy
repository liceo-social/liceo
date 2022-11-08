package social.liceo.data.csv

import spock.lang.Shared
import spock.lang.Specification
import spock.lang.TempDir

import java.nio.file.Files
import java.nio.file.Path

class CsvWriterSpec extends Specification {
  @Shared @TempDir Path tempDir

  def "writes a csv file with all values"() {
    given:
    File csvFile = createTempFile()
    Person person = Person.builder()
      .name("John Doe")
      .age(12)
      .address("12th Parra St")
      .build()

    when:
    CSVWriter.builder()
      .lines(person.collect())
      .transformer(TRANSFORMER)
      .build()
      .writeTo(new FileWriter(csvFile))

    def (name, age, address) = getFirstLineAfterHeaderValues(csvFile)

    then:
    name    == "John Doe"
    age     == "12"
    address == "12th Parra St"
  }

  def "writes some of the properties but lines do maintain length"() {
    given:
    File csvFile = createTempFile()
    Person person = Person.builder()
      .name("John Doe")
      .age(22)
      .build()

    when:
    CSVWriter.builder()
      .lines(person.collect())
      .transformer(TRANSFORMER)
      .build()
      .writeTo(new FileWriter(csvFile))

    def (name, age, address) = getFirstLineAfterHeaderValues(csvFile)

    then:
    name == "John Doe"
    age  == "22"

    and:
    !address
  }

  def "writes only specified headers"() {
    given:
    File csvFile = createTempFile()
    Person person = Person.builder()
      .name("John Doe")
      .age(22)
      .address("12th Parra St")
      .build()

    when:
    CSVWriter.builder()
      .lines(person.collect())
      .transformer(TRANSFORMER)
      .headerNames(["name", "address"])
      .build()
      .writeTo(new FileWriter(csvFile))

    def (name, address) = getFirstLineAfterHeaderValues(csvFile)

    then:
    name == "John Doe"
    address == "12th Parra St"
  }

  def "checks to special character in rows"() {
    given:
    File csvFile = createTempFile()
    Person person = Person.builder()
      .name("John${separator} Doe")
      .age(22)
      .address("12th ${separator}Parra St")
      .build()

    when:
    CSVWriter.builder()
      .lines(person.collect())
      .transformer(TRANSFORMER)
      .headerNames(["name", "address"])
      .build()
      .writeTo(new FileWriter(csvFile))

    def (name, address) = getFirstLineAfterHeaderValues(csvFile)

    then:
    name == "John Doe"
    address == "12th Parra St"
    where:
    separator << ["|", ","]
  }

  private static final Closure<Map<String,?>> TRANSFORMER = { Person p ->
    return [name: p.name, age: p.age, address: p.address]
  }

  private File createTempFile() {
    return Files.createTempFile(tempDir, "liceo", "csv").toFile()
  }

  private static String[] getFirstLineAfterHeaderValues(File file) {
    assert file.readLines().size() > 1
    return file.readLines().get(1).split("\\|", -1)
  }
}
