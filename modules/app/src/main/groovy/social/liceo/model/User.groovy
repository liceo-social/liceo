package social.liceo.model

class User {
  private static final ROLE_ADMIN = "ROLE_ADMIN"
  private static final ROLE_WORKER = "ROLE_USER"

  Serializable id
  String[] roles = []

  Boolean isAdmin() {
    return ROLE_ADMIN in this.roles
  }

  Boolean isWorker() {
    return ROLE_WORKER in this.roles
  }
}
