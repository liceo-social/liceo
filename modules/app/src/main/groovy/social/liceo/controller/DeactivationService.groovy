package social.liceo.controller

import groovy.transform.TupleConstructor
import groovy.transform.builder.Builder
import groovy.util.logging.Slf4j
import social.liceo.model.Deactivation
import social.liceo.model.Person
import social.liceo.common.model.Result
import social.liceo.model.User

import javax.transaction.Transactional

@Slf4j
@Transactional
@TupleConstructor(defaults = false, useSetters = false)
abstract class DeactivationService {
  DeactivationDAO deactivationDAO
  FindPersonByIdDAO findPersonByIdDAO
  SecurityDAO securityDAO

  @Builder
  static class RequestParams {
    Long personId
    String motivation
    Date deactivationDate
  }

  Result<Deactivation> request(RequestParams params) {
    Person person = findPersonByIdDAO.findPersonById(params.personId)
    User requestedBy = securityDAO.sessionUser
    Result<Deactivation> result = person.requestDeactivation(requestedBy, params.motivation, params.deactivationDate)

    return result.ifSuccess {
      deactivationDAO.saveRequest(person)
    }
  }

  @Builder
  static class ApprovalParams {
    Long personId
    String motivation
  }

  Result<Deactivation> approve(ApprovalParams params) {
    Person person = findPersonByIdDAO.findPersonById(params.personId)
    User approvedBy = securityDAO.sessionUser
    Result<Deactivation> result = person.approveDeactivation(approvedBy, params.motivation)

    return result.ifSuccess {
      deactivationDAO.saveApproval(person)
    }
  }

  @Builder
  static class DirectDeactivationParams {
    Long personId
    String motivation
  }

  Result<Deactivation> deactivate(DirectDeactivationParams params) {
    RequestParams requestParams = RequestParams.builder()
      .personId(params.personId)
      .motivation(params.motivation)
      .build()

    Result<Deactivation> requestResult = request(requestParams)

    if (requestResult.hasError()) {
      return requestResult
    }

    ApprovalParams approvalParams = ApprovalParams.builder()
      .personId(params.personId)
      .motivation(params.motivation)
      .build()

    return approve(approvalParams)
  }
}
