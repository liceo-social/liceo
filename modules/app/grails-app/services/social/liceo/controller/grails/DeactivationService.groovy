package social.liceo.controller.grails

import grails.gorm.transactions.Transactional
import social.liceo.controller.DeactivationDAO
import social.liceo.controller.DeactivationService as CommonDeactivationService
import social.liceo.controller.FindPersonByIdDAO
import social.liceo.controller.SecurityDAO
import social.liceo.model.Deactivation
import social.liceo.common.model.Result

import javax.inject.Inject

class DeactivationService extends CommonDeactivationService {
  @Inject
  DeactivationService(DeactivationDAO deactivationDAO, FindPersonByIdDAO findPersonByIdDAO, SecurityDAO securityDAO) {
    super(deactivationDAO, findPersonByIdDAO, securityDAO)
  }

  @Override
  @Transactional
  Result<Deactivation> request(RequestParams params) {
    return super.request(params)
  }

  @Override
  @Transactional
  Result<Deactivation> approve(ApprovalParams params) {
    return super.approve(params)
  }

  @Override
  @Transactional
  Result<Deactivation> deactivate(DirectDeactivationParams params) {
    return super.deactivate(params)
  }
}
