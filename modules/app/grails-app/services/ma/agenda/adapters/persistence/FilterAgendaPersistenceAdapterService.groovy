package ma.agenda.adapters.persistence

import ma.Person
import ma.Process
import ma.ProcessType
import ma.Project
import ma.agenda.application.port.out.LoadAllPersonByUserPort
import ma.agenda.application.port.out.LoadAllProcessTypePort
import ma.agenda.application.port.out.LoadAllProjectByUserPort
import ma.agenda.application.port.out.LoadEventsByFiltersPort
import ma.agenda.domain.EventEntity
import ma.agenda.domain.PersonEntity
import ma.agenda.domain.ProcessTypeEntity
import ma.agenda.domain.ProjectEntity
import ma.security.User

import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime

/**
 * Persistence implementation needed to show the agenda
 *
 * @since 0.3.0
 */
class FilterAgendaPersistenceAdapterService implements
  LoadAllPersonByUserPort,
  LoadAllProjectByUserPort,
  LoadAllProcessTypePort,
  LoadEventsByFiltersPort {

  @Override
  List<PersonEntity> loadAllPersonByUser(Long userID) {
    User professional = User.get(userID)

    List<Person> people = Person.createCriteria().listDistinct {
      if (!professional.isAdmin()) {
        projects {
          processes {
            eq("createdBy", professional)
          }
        }
      }
    }

    return people.collect {
      toPersonEntity(it)
    }
  }

  private static PersonEntity toPersonEntity(Person person) {
    return new PersonEntity(id: person.id, fullName: person.fullname)
  }

  @Override
  List<ProcessTypeEntity> loadAllProcessTypes() {
    List<ProcessType> processTypes = ProcessType.createCriteria().listDistinct {}

    return processTypes.collect {
      toProcessTypeEntity(it)
    }
  }

  private static ProcessTypeEntity toProcessTypeEntity(ProcessType processType) {
    return new ProcessTypeEntity(id: processType.id, name: processType.name)
  }

  @Override
  List<ProjectEntity> loadAllProjectByUser(Long userID) {
    User professional = User.get(userID)

    List<Project> projects = Project.createCriteria().listDistinct {
      if (!professional.isAdmin()) {
        processes {
          createdBy {
            eq "id", userID
          }
        }
      }
    }

    return projects.collect {
      toProjectEntity(it)
    }
  }

  private static ProjectEntity toProjectEntity(Project project) {
    return new ProjectEntity(id: project.id, name: project.name)
  }

  @Override
  Set<EventEntity> filterByPeopleProjectAndType(
    Long userID,
    Date startDate,
    Boolean onlyUserProcesses,
    Set<Long> selectedPeople,
    Set<Long> selectedProjects,
    Set<Long> selectedProcessTypes) {

    User professional = User.get(userID)
    Date endDate = startDate?.toLocalDateTime()?.plusMonths(1)?.toDate()

    List<Process> processes = Process.createCriteria().list {
      if (onlyUserProcesses && professional) {
          eq("createdBy", professional)
      }

      if (selectedPeople) {
        person {
          inList("id", selectedPeople)
        }
      }

      if (selectedProjects) {
        project {
          inList("id", selectedProjects)
        }
      }

      if (selectedProcessTypes) {
        type {
          inList("id", selectedProcessTypes)
        }
      }

      between("meetingDate", startDate, endDate)
    }

    return processes.collect {
      toEventEntity(it)
    } as Set<EventEntity>
  }

  private static EventEntity toEventEntity(Process process) {
    LocalDate localDate = process
      .meetingDate
      .toLocalDate()

    LocalTime defaultLocalTime = LocalTime.of(0, 0)

    LocalDateTime startStr = LocalDateTime
      .of(localDate, process.meetingStartTime ?: defaultLocalTime)

    LocalDateTime endStr = LocalDateTime
      .of(localDate, process.meetingEndTime ?: defaultLocalTime)

    return new EventEntity(
      id: process.id,
      title: process.person.fullname,
      description: process.description,
      startStr: startStr,
      endStr: endStr,
      allDay: process.allDay
    )
  }
}
