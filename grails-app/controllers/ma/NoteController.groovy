package ma

import ma.common.adapters.web.command.Pagination
import ma.controller.FlashMessageAware
import ma.controller.PaginationAware
import ma.controller.SecurityAware
import ma.note.NoteCreationCommand
import ma.note.NoteService
import ma.security.SecurityRulesService

/**
 * Handles request over {@link Note} insances
 *
 * @since 0.4.0
 */
class NoteController implements FlashMessageAware, SecurityAware, PaginationAware {

  NoteService noteService
  SecurityRulesService securityRulesService

  /**
   * Shows a list of notes. Notes can be filtered by the person they're about and the severity
   *
   * @param person the person the note is about
   * @param severity the importance of the note
   * @param pagination how to paginate over the list of notes
   * @since 0.4.0
   */
  def index(Person person, String severity, Pagination pagination) {
    Boolean showResolved = severity == 'RESOLVED_TOO'
    String resolvedSeverity = severity == 'RESOLVED_TOO' ? null : severity

    List<Note> notes = noteService
      .filterByPersonAndSeverity(person, resolvedSeverity, showResolved, checkPagination(pagination).asMap())

    render(
      view: 'index',
      model: [
        notes: notes,
        person: person
      ]
    )
  }

  def create(NoteCreationCommand command) {
    if (command.hasErrors()) {
      showValidationErrorMessage()
      render status: 404
      return
    }

    Person person = Person.get(command.person)
    return [person: person, note: new Note()]
  }

  def edit(Note note) {
    if (!securityRulesService.isCreatedByOrAdmin(note.createdBy)) {
      notAuthorized()
      return
    }

    render(
      view: 'edit',
      model: [
        person: note.person,
        note: note
      ]
    )
  }

  def save(Note note) {
    if (note.hasErrors()) {
      showValidationErrorMessage()
      respond(
        note.errors,
        view: 'create',
        model: [
          person: note.person
        ]
      )
      return
    }

    noteService.save(note)
    redirect(controller: 'note', action: 'index', id: note.person.id)
  }

  def update(Note note) {
    if (note.hasErrors()) {
      showValidationErrorMessage()
      respond(
        note.errors,
        view: 'edit',
        model: [
          person: note.person,
        ]
      )
      return
    }

    noteService.save(note)
    redirect(controller: 'note', action: 'index', id: note.person.id)
  }

  def delete(Note note) {
    if (!securityRulesService.isCreatedByOrAdmin(note.createdBy)) {
      notAuthorized()
      return
    }

    noteService.delete(note)
    showSuccessMessage("note.delete.success.description")
    redirect(constroller: 'note', action: 'index', id: note.person.id)
  }

  def resolve(Note note) {
    if (note.resolution) {
      noteService.resolve(note)
      showSuccessMessage("note.resolution.success.description")
    } else {
      showErrorMessage("note.resolution.missing.resolution")
    }
    redirect(constroller: 'note', action: 'index', id: note.person.id)
  }
}
