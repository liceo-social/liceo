package social.liceo.model

import social.liceo.common.model.Result

import java.time.OffsetDateTime
import java.time.ZoneOffset

class Person {
  private Serializable id
  private Deactivation deactivation = Deactivation.builder().build()

  Boolean isDeactivationAllowed() {
    return isDeactivationRequested() && isActive()
  }

  Boolean isActive() {
    return !this.deactivation.isApproved()
  }

  Boolean isDeactivationRequested() {
    return this.deactivation.isRequested()
  }

  Result<Deactivation> requestDeactivation(User requestedBy, String motivation, Date deactivationDate) {
    // #TODO delete this probably move OffsetDatetime to Date
    OffsetDateTime selected = deactivationDate
      ? OffsetDateTime.of(deactivationDate.toLocalDateTime(), ZoneOffset.ofHours(1))
      : null

    return this.deactivation.createRequest(requestedBy, motivation, selected)
  }

  Result<Deactivation> approveDeactivation(User approvedBy, String motivation) {
    return this.deactivation.approve(approvedBy, motivation)
  }

  User getDeactivationRequestedBy() {
    return this.deactivation.requestedBy
  }

  User getDeactivationApprovedBy() {
    return this.deactivation.approvedBy
  }

  String getDeactivationMotivation() {
    return this.deactivation.motivation
  }

  Date getDeactivationApprovalDate() {
    return this.deactivation.approvalDate?.toDate()
  }
}
