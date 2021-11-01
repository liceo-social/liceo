package ma.agenda.adapters.web

import grails.web.mapping.LinkGenerator
import ma.agenda.application.port.out.ResolveLinkPort

/**
 * @since 0.3.0
 */
class ResolveLinkPortService implements ResolveLinkPort {

  LinkGenerator grailsLinkGenerator

  @Override
  String resolveLink(Map config) {
    return grailsLinkGenerator.link(config)
  }
}
