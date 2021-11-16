package social.liceo.model

import social.liceo.common.model.Result

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

  Result<Deactivation> requestDeactivation(User requestedBy, String motivation) {
    return this.deactivation.createRequest(requestedBy, motivation)
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
}
