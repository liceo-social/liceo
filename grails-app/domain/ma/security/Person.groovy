package ma.security

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import ma.storage.Attachment

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Person implements Serializable {

    private static final long serialVersionUID = 1

    Attachment photo

    String username
    String password

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Authority> getAuthorities() {
        (PersonAuthority.findAllByPerson(this) as List<PersonAuthority>)*.authority as Set<Authority>
    }

    boolean isAdmin() {
        return 'ROLE_ADMIN' in authorities.authority
    }

    /**
     * Embedded relationship
     *
     * @since 0.1.0
     */
    static embedded = ['photo']

    /**
     * User constraints
     *
     * @since 0.1.0
     */
    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
    }

    /**
     * Specific database mappings
     *
     * @since 0.1.0
     */
    static mapping = {
	    password column: '`password`'
    }
}