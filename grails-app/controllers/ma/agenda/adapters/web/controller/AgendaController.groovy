package ma.agenda.adapters.web.controller

import grails.databinding.BindInitializer
import grails.databinding.BindingFormat
import grails.plugin.springsecurity.SpringSecurityService
import grails.validation.Validateable
import groovy.transform.ToString
import ma.agenda.application.port.in.FilterAgendaUseCase
import ma.agenda.domain.EventEntity
import ma.agenda.domain.model.FilterAgendaModel
import ma.controller.FlashMessageAware
import org.springframework.beans.factory.annotation.Autowired

import java.time.format.DateTimeFormatter

/**
 * Manages the user processes agenda.
 *
 * @since 0.3.0
 */
class AgendaController implements FlashMessageAware {

  @Autowired
  SpringSecurityService springSecurityService

  @Autowired
  FilterAgendaUseCase filterAgendaUseCase

  /**
   * Sets the filter options of the current agenda
   *
   * @param command filter options
   * @since 0.3.0
   */
  def index(FilterProcessesCommand command) {
    Integer userID = springSecurityService.currentUser.id
    FilterAgendaUseCase.Input input = FilterAgendaUseCase.Input
      .builder()
      .userID(userID)
      .onlyUserProcesses(command.onlyMines)
      .startDate(command.start)
      .selectedPeople(command.selectedPeople)
      .selectedProjects(command.selectedProjects)
      .selectedProcessTypes(command.selectedProcessTypes)
      .build()

    FilterAgendaModel model = filterAgendaUseCase.loadAgenda(input)

    render(
      view: 'index',
      model: [
        filter: command,
        filterOptions: model
      ]
    )
  }

  /**
   * Updates the calendar information
   *
   * @param command calendar filters
   * @since 0.3.0
   */
  def search(FilterProcessesCommand command) {
    Integer userID = springSecurityService.currentUser.id
    FilterAgendaUseCase.Input input = FilterAgendaUseCase.Input
      .builder()
      .userID(userID)
      .onlyUserProcesses(command.onlyMines)
      .startDate(command.start)
      .selectedPeople(command.selectedPeople)
      .selectedProjects(command.selectedProjects)
      .selectedProcessTypes(command.selectedProcessTypes)
      .build()

    FilterAgendaModel model = filterAgendaUseCase.loadAgenda(input)

    render(template: 'templates/calendar', model: [filter: command, filterOptions: model])
  }

  /**
   * Loads all events between two dates given the filters passed as JSON response.
   * This action is used by the agenda's calendar
   *
   * @param command filters to narrow the event search
   * @since 0.3.0
   */
  def events(FilterProcessesCommand command) {
    Integer userID = springSecurityService.currentUser.id
    FilterAgendaUseCase.Input input = FilterAgendaUseCase.Input
      .builder()
      .userID(userID)
      .onlyUserProcesses(command.onlyMines)
      .startDate(command.start)
      .selectedPeople(command.selectedPeople)
      .selectedProjects(command.selectedProjects)
      .selectedProcessTypes(command.selectedProcessTypes)
      .build()

    FilterAgendaModel model = filterAgendaUseCase.loadAgenda(input)

    render(contentType: 'application/json') {
      events(model.events.toList()) { EventEntity event ->
        id event.id
        title event.title
        start event.startStr.format(DateTimeFormatter.ISO_DATE_TIME)
        end event.endStr.format(DateTimeFormatter.ISO_DATE_TIME)
        allDay event.allDay
        extendedProps {
          url event.url
          description event.description
        }
      }
    }
  }
}

/**
 * Filter selection when searching for appointments
 *
 * @since 0.3.0
 */
@ToString
class FilterProcessesCommand implements Validateable {

  @BindingFormat("MM/dd/yyyy")
  @BindInitializer({ cmd -> new FilterProcessesCommand(start: getFirstDayOfMonth() )})
  Date start

  @BindingFormat("MM/dd/yyyy")
  Date end

  Boolean onlyMines

  Set<Long> selectedPeople
  Set<Long> selectedProjects
  Set<Long> selectedProcessTypes

  static Date getFirstDayOfMonth() {
    Calendar today = Calendar.instance
    today.set(Calendar.DAY_OF_MONTH, 1)

    return new Date(today.toInstant().toEpochMilli())
  }

  static constraints = {
    end nullable: true
  }
}


