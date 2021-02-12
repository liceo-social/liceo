package ma.note

import grails.gorm.transactions.Transactional
import ma.Note
import ma.Person

/**
 * Handles how to serve data related to {@link Note} instances
 *
 * @since 0.4.0
 */
class NoteService {

  /**
   * Filters out the list of a person's notes
   *
   * @param person the person the note is about
   * @param severity the importance of the notes
   * @param showResolved whether or not to show resolved notes
   * @param pagination how to paginate over the result list
   * @return a collection of {@link Note} instances
   * @since 0.4.0
   */
  List<Note> filterByPersonAndSeverity(
    Person person,
    String severity,
    Boolean showResolved,
    Map<String, ?> pagination) {
    return Note.createCriteria().list(pagination) {
      if (severity) {
        eq("severity", severity)
      }

      if (!showResolved) {
        isNull("resolutionDate")
      }

      eq("person", person)
    }
  }

  @Transactional
  Note save(Note note) {
    return note.save()
  }

  @Transactional
  Note delete(Note note) {
    return note.delete()
  }

  @Transactional
  Note resolve(Note note) {
    note.resolutionDate = new Date()
    return note.save()
  }
}
