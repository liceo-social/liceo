package social.liceo.common.model

abstract class Checker<T> {
  private final ResultError error

  Checker(String code, String message) {
    this.error = new ResultError(code, message)
  }

  abstract Boolean accept(T value)

  ResultError getError() {
    return this.error
  }
}
