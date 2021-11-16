package ma.note

import grails.validation.Validateable

/**
 * Command to create a new note
 *
 * @since 0.4.0
 */
class NoteCreationCommand implements Validateable {
  /**
   * The only required information to create a new note is the person
   * the note refers to
   *
   * @since 0.4.0
   */
  Long person

  static constraints = {
    person nullable: false
  }
}
