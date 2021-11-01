package ma.controller

import grails.util.Holders
import ma.common.adapters.web.command.Pagination

/**
 * Used by controllers to ensure pagination init values
 *
 * @since 0.3.0
 */
trait PaginationAware {

  /**
   * Checks that pagination is properly initialized before
   * using it in any controller's action
   *
   * @param pagination pagination from request
   * @return pagination properly initialized to be used
   * @since 0.3.0
   */
  Pagination checkPagination(Pagination pagination) {
    if (!pagination.max) {
      pagination.max = Holders.config.app.pagination.max
    }
    return pagination
  }
}
