package social.liceo.common.model

import groovy.transform.EqualsAndHashCode
import groovy.transform.TupleConstructor

@EqualsAndHashCode(includes = "code")
@TupleConstructor(defaults = false, useSetters = false)
class ResultError {
  String code
  String message
}
