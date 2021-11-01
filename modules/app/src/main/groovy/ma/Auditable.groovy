package ma

import ma.security.User

class Auditable {

  /**
   * The user who created the record
   *
   * @since 0.2.0
   */
  User createdBy

  /**
   * The user who created the record
   *
   * @since 0.2.0
   */
  User updatedBy

  static constraints = {
    createdBy nullable: true
    updatedBy nullable: true
  }
}
