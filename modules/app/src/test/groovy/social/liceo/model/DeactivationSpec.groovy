package social.liceo.model

import social.liceo.common.model.Result
import social.liceo.model.tags.DeactivationTest
import spock.lang.Specification

@DeactivationTest
class DeactivationSpec extends Specification {
  private static final MOTIVATION = "motivation"
  private static final USER = new User()
  private static final USER_ADMIN = new User(roles: ['ADMIN'])

  def 'check deactivation has been requested properly'() {
    given:
    Deactivation deactivation = new Deactivation()

    when:
    deactivation.createRequest(USER, MOTIVATION)

    then:
    deactivation.isRequested()
  }

  def 'check deactivation request fails because it has already been requested'() {
    when:
    Result<Deactivation> result = alreadyRequestedDeactivation.createRequest(USER, MOTIVATION)

    then:
    result.error == DeactivationErrors.ALREADY_REQUESTED
  }

  def 'check deactivation has been approved properly'() {
    given:
    Deactivation deactivation = alreadyRequestedDeactivation

    when:
    deactivation.approve(USER_ADMIN, MOTIVATION)

    then:
    deactivation.isApproved()
  }

  def 'check approval fails because approving user is not an admin'() {
    when:
    Result<Deactivation> result = alreadyRequestedDeactivation.approve(USER, MOTIVATION)

    then:
    result.error == DeactivationErrors.APPROVED_BY_NOT_AN_ADMIN
  }

  private static Deactivation getAlreadyRequestedDeactivation() {
    return Deactivation.builder().requestedBy(USER).motivation(MOTIVATION).build()
  }
}
