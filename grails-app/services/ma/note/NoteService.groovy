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
   * @param pagination how to paginate over the result list
   * @return a collection of {@link Note} instances
   * @since 0.4.0
   */
  List<Note> filterByPersonAndSeverity(Person person, String severity, Map<String, ?> pagination) {
    return Note.createCriteria().list(pagination) {
      if (severity) {
        eq("severity", severity)
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
}
