package ma.person

/**
 * ISO-3166 country representation
 */
class Country {

    /**
     * Default name
     *
     * @since 0.1.0
     */
    String name

    /**
     * ISO-3166 alpha2 code
     *
     * @since 0.1.0
     */
    String code

    @Override
    String toString() {
        return name
    }
}
