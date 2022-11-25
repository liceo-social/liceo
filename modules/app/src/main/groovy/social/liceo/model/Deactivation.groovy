package social.liceo.model

import groovy.transform.builder.Builder
import social.liceo.common.model.NotBlank
import social.liceo.common.model.NotNull
import social.liceo.common.model.Result

import java.time.OffsetDateTime

import static social.liceo.model.DeactivationErrors.ALREADY_REQUESTED
import static social.liceo.model.DeactivationErrors.APPROVED_BY_NOT_AN_ADMIN

@Builder
class Deactivation {
  User approvedBy
  User requestedBy
  String motivation
  OffsetDateTime approvalDate

  Result<Deactivation> createRequest(
    @NotNull User requestedBy,
    @NotBlank String motivation,
    OffsetDateTime approvalDate = null) {
    if (this.requestedBy) {
      return Result.error(ALREADY_REQUESTED)
    }

    this.requestedBy = requestedBy
    this.motivation = motivation
    this.approvalDate = approvalDate

    return Result.success(this)
  }

  Boolean isRequested() {
    return this.requestedBy
  }

  Boolean isNotRequested() {
    return !this.isRequested()
  }

  Boolean isApproved() {
    return this.approvedBy
  }

  Boolean isNotApproved() {
    return !this.isApproved()
  }

  Result<Deactivation> approve(@NotNull User approvedBy, @NotBlank String motivation) {
    if (!approvedBy.isAdmin()) {
      return Result.error(APPROVED_BY_NOT_AN_ADMIN)
    }

    this.approvedBy = approvedBy
    this.motivation = motivation

    if (!this.approvalDate) {
      this.approvalDate = OffsetDateTime.now()
    }

    return Result.success(this)
  }
}
