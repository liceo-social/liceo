package ma

import grails.gorm.transactions.Transactional

@Transactional
class AuthorizationService {

    Authorization save(Authorization authorization) {
        return authorization.save()
    }
}
