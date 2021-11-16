package ma.security

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    /**
     * Saves a new user
     *
     * @param user the user to save
     * @return the saved user
     * @since 0.1.0
     */
    User save(User user) {
        User saved = user.save(flush: true)

        if (saved.isAdmin()) {
            UserAuthority.create(saved, Authority.findByAuthority('ROLE_ADMIN'))
        } else {
            UserAuthority.create(saved, Authority.findByAuthority('ROLE_USER'))
        }

        return saved
    }

    void delete(User user) {
        UserAuthority
            .where {  person == user }
            .deleteAll()

        user.delete()
    }
}
