package social.liceo.controller

import social.liceo.model.User

interface SecurityDAO {
  User getSessionUser()
}
