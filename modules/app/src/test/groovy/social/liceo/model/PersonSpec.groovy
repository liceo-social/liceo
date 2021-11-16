package social.liceo.model

import social.liceo.model.tags.DeactivationTest
import spock.lang.Shared
import spock.lang.Specification

class PersonSpec extends Specification {
  private static final MOTIVATION = "motivation"
  private static final USER = new User(roles: [User.ROLE_WORKER])
  private static final USER_ADMIN = new User(roles: [User.ROLE_ADMIN])

  @Shared Person person = new Person()

  def setup() {
    this.person = new Person()
  }

  @DeactivationTest
  def 'when deactivation is requested we can ask if deactivation is been requested'() {
    given:
    person.requestDeactivation(USER, MOTIVATION)

    expect:
    person.isDeactivationRequested()
    person.deactivationRequestedBy == USER
    person.deactivationMotivation == MOTIVATION
  }

  @DeactivationTest
  def 'when deactivation is approved person is no longer active'() {
    given:
    requestAndApproveDeactivation()

    expect:
    !person.isActive()
    person.deactivationApprovedBy == USER_ADMIN
  }

  private void requestAndApproveDeactivation() {
    person.requestDeactivation(USER, MOTIVATION)
    person.approveDeactivation(USER_ADMIN, MOTIVATION)
  }
}
