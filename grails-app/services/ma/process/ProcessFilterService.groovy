package ma.process

import ma.Person
import ma.Process
import ma.Project
import ma.csv.CSV
import ma.csv.CSVWriter

import java.nio.file.Files
import java.text.SimpleDateFormat

/**
 * Services used to filter processes
 *
 * @since 0.3.0
 */
class ProcessFilterService {

  /**
   * Filters processes by the project and person the process belongs to
   *
   * @param project project the process belongs to
   * @param person the person the process is referred to
   * @param pagination how to paginate the result list
   * @return a paginated list
   * @since 0.3.0
   */
  List<Process> filterByProjectAndPerson(Project project, Person person, Map pagination) {
    return Process.createCriteria().list(pagination) {
      if (project) {
        eq("project", project)
      }

      eq("person", person)
    }
  }

  File export(Project project, Person person) {
    List<Process> result = filterByProjectAndPerson(project, person, [:])
    CSVWriter writer = CSV.from(result) { Process process ->
      return [
        processID: process.id,
        personID: process.person.id,
        personName: process.person.fullname,
        description: process.description,
        type: process.type.name,
        project: process.project.code,
        allDay: process.allDay,
        date: process.meetingDate,
        startTime: process.meetingStartTime,
        endTime: process.meetingEndTime
      ]
    }

    String dateFormat = new SimpleDateFormat("yyyy-MM-dd").format(new Date())
    File temporalFile = Files
      .createTempFile("liceo-${dateFormat}-", ".csv")
      .toFile()

    writer.writeTo(temporalFile.newWriter('UTF-8'))

    return temporalFile
  }
}
