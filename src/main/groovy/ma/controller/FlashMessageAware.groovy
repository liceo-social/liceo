package ma.controller

/**
 * Any controller implementing this trait will be able to
 * send messages to the flash scope with a better and
 * structured way
 *
 * @since 0.1.0
 */
trait FlashMessageAware {

    void showSuccessMessage(String message, String... args) {
        flash.title = "default.success.title"
        flash.message = message
        flash.args = args
        flash.type = "success"
    }

    void showInfoMessage(String message) {
        flash.title = "default.info.title"
        flash.message = message
    }

    void showErrorMessage(String message) {
        flash.title = "default.error.title"
        flash.message = message
        flash.type = "danger"
    }

    void showValidationErrorMessage(String message = "default.error.validation.description") {
        flash.title = "default.error.validation.title"
        flash.message = message
        flash.type = "danger"
    }

}
