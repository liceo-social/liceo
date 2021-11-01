package ma.controller

/**
 * Methods used by controllers in order to enforce security rules
 *
 * @since 0.2.0
 */
trait SecurityAware {

  /**
   * Redirects the user to the configured response for a 403 status
   * response
   *
   * @since 0.2.0
   */
  def notAuthorized() {
    render status: 403
  }
}
