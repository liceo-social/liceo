package ma.security

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class UserAuthority implements Serializable {

	private static final long serialVersionUID = 1

	User person
	Authority authority

	@Override
	boolean equals(other) {
		if (other instanceof UserAuthority) {
			other.personId == person?.id && other.authorityId == authority?.id
		}
	}

    @Override
	int hashCode() {
	    int hashCode = HashCodeHelper.initHash()
        if (person) {
            hashCode = HashCodeHelper.updateHash(hashCode, person.id)
		}
		if (authority) {
		    hashCode = HashCodeHelper.updateHash(hashCode, authority.id)
		}
		hashCode
	}

	static UserAuthority get(long personId, long authorityId) {
		criteriaFor(personId, authorityId).get()
	}

	static boolean exists(long personId, long authorityId) {
		criteriaFor(personId, authorityId).count()
	}

	private static DetachedCriteria criteriaFor(long personId, long authorityId) {
		UserAuthority.where {
			person == User.load(personId) &&
			authority == Authority.load(authorityId)
		}
	}

	static UserAuthority create(User person, Authority authority, boolean flush = false) {
		def instance = new UserAuthority(person: person, authority: authority)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(User u, Authority r) {
		if (u != null && r != null) {
			UserAuthority.where { person == u && authority == r }.deleteAll()
		}
	}

	static int removeAll(User u) {
		u == null ? 0 : UserAuthority.where { person == u }.deleteAll() as int
	}

	static int removeAll(Authority r) {
		r == null ? 0 : UserAuthority.where { authority == r }.deleteAll() as int
	}

	static constraints = {
	    person nullable: false
		authority nullable: false, validator: { Authority r, UserAuthority ur ->
			if (ur.person?.id) {
				if (UserAuthority.exists(ur.person.id, r.id)) {
				    return ['userRole.exists']
				}
			}
		}
	}

	static mapping = {
		id composite: ['person', 'authority']
		version false
	}
}
