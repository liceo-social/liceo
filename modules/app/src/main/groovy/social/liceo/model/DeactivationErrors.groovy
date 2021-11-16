package social.liceo.model

import social.liceo.common.model.ResultError

class DeactivationErrors {
  static final ResultError ALREADY_REQUESTED =
    new ResultError("person.deactivate.already_requested", "Deactivation already requested")
  static final ResultError APPROVED_BY_NOT_AN_ADMIN =
    new ResultError("person.deactivate.user_not_admin", "Deactivation should be approved by an admin")
}
