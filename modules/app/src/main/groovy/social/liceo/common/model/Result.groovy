package social.liceo.common.model

import java.util.function.Function

class Result<SUCCESS> {
  private SUCCESS successPayload
  private ResultError errorPayload

  Boolean hasError() {
    return this.errorPayload
  }

  Result<SUCCESS> ifSuccess(Closure closure) {
    if (!this.hasError()) {
      try {
        closure()
      } catch (Exception ex) {
        this.errorPayload = new ResultError("exceptional", ex.message)
      }
    }
    return this
  }

  Result<SUCCESS> flatMap(Function<SUCCESS, Result<SUCCESS>> fn) {
    if (this.hasError()) {
      return this
    }
    return fn.apply(this.successPayload)
  }

  Result<SUCCESS> check(Checker<SUCCESS> checker) {
    if (!this.hasError()) {
      return checker.accept(this.successPayload) ? this : error(checker.error)
    }
    return this
  }

  static <S> Result<S> error(String code, String message) {
    return error(new ResultError(code, message))
  }

  static <S> Result<S> error(ResultError error) {
    return new Result<S>(errorPayload: error)
  }

  static <S> Result<S> success(S payload) {
    return new Result<S>(successPayload: payload)
  }

  SUCCESS getSuccess() {
    return this.successPayload
  }

  ResultError getError() {
    return this.errorPayload
  }
}
