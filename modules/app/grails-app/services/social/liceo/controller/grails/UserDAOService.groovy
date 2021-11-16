package social.liceo.controller.grails

import ma.security.User as UserEntity
import social.liceo.controller.FindUserByIdDAO
import social.liceo.model.User

class UserDAOService implements FindUserByIdDAO {
  @Override
  User findUserById(Serializable id) {
    UserEntity userEntity = UserEntity.get(id)
    List<String> roles = userEntity.authorities.authority
    return new User(id: userEntity.id, roles: roles)
  }
}
