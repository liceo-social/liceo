package ma.authorization

import grails.gorm.transactions.Transactional
import ma.Authorization

@Transactional
class AuthorizationService {

    Authorization save(Authorization authorization) {
        return authorization.save()
    }
}
