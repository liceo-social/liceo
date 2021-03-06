package ma.person

class Genre {

    /**
     * Default name used when there's no code to
     * use to translate it
     *
     * @since 0.1.0
     */
    String name

    /**
     * Code to translate the genre
     *
     * @since 0.1.0
     */
    String code

    @Override
    String toString() {
        return name
    }

    static constraints = {
        code nullable: true
    }
}
