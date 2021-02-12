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

  String resolution
  Date resolutionDate

  static constraints = {
    severity inList: ['NOTE', 'WARNING', 'DANGER']
    resolution nullable: true
    resolutionDate nullable: true
  }

  static mapping = {
    sort dateCreated: 'desc'
  }
}
