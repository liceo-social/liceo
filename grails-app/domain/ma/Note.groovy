package ma

/**
 * Notes to remember actions to take over a given person. It could have
 * different levels of severity
 *
 * @since 0.4.0
 */
class Note extends Auditable implements Dateable {
  static belongsTo = [person: Person]

  String comment
  String severity

  static constraints = {
    severity inList: ['NOTE', 'WARNING', 'DANGER']
  }

  static mapping = {
    sort dateCreated: 'desc'q
  }
}
