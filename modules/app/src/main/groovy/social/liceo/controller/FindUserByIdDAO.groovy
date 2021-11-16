package social.liceo.controller

import social.liceo.model.User

interface FindUserByIdDAO {
  User findUserById(Serializable id)
}
