package ma

/**
 * It's a unit where a given person has relationships
 * with other people. e.g: family, friends...
 *
 * @since 0.1.0
 */
class Relationship extends Auditable implements Dateable {

    /**
     * A relationship is created around a specific person
     *
     * @since 0.1.0
     */
    static belongsTo = [person: Person]

    /**
     * This relationship has several people related to
     * the main person
     *
     * @since 0.1.0
     */
    static hasMany = [
      persons: Person
    ]

    /**
     * Name given to this relationships related
     * to a given person
     *
     * @since 0.1.0
     */
    String name

    /**
     * Constraints of the {@link Relationship} entity
     *
     * @since 0.1.0
     */
    static constraints = {
        name nullable: false
    }
}
