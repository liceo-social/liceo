package ma.security

import ma.controller.FlashMessageAware
import ma.storage.Attachment

class UserController implements FlashMessageAware {

    static scaffold = User

    UserService userService

    def save(User user) {
        if (user.hasErrors()) {
            showValidationErrorMessage()
            respond(user.errors, view: 'create', model: [user: user])
            return
        }

        User saved = userService.save(user)

        showSuccessMessage("user.save.success.description", user.username)
        redirect(
            action: 'index'
        )
    }

    def delete(User user) {
        userService.delete(user)

        showSuccessMessage("user.delete.success.description", user.username)
        redirect(action: 'index')
    }

    def update(User user) {
        if (user.hasErrors()) {
            showValidationErrorMessage()
            respond(user.errors, view: 'edit', model: [user: user])
            return
        }

        User.withTransaction {
            user.save()
        }

        showSuccessMessage("user.edit.success.description", user.username)
        redirect(action: 'index')
    }

    def changePasswordEdit(User user) {
        render(
            view: 'password',
            model: [user: user, command: new ChangePasswordCommand()]
        )
    }

    def changePasswordUpdate(ChangePasswordCommand command) {
        User user = User.get(command.id)

        if (command.hasErrors()) {
            showValidationErrorMessage()
            respond(command.errors, view: 'password', model: [user: user, command: command])
            return
        }

        User.withTransaction {
            user.password = command.password
            user.save()
        }

        showSuccessMessage("user.password.change.success.description", user.username)
        redirect(action: 'index')
    }

    def editPhoto(User user) {
        render(view: 'photoEdit', model: [user: user])
    }

    def updatePhoto(User user) {
        if (user.photo) {
            User.withTransaction {
                user.save(failOnError: true)
            }
        }

        redirect(action: 'edit', id: user.id)
    }
}

class ChangePasswordCommand {
    Long id
    String password
    String passwordAgain

    static constraints = {
        password nullable: false, validator: { val, obj ->
            obj.passwordAgain == val
        }
    }
}
