package ma.security

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class PersonAuthority implements Serializable {

	private static final long serialVersionUID = 1

	Person person
	Authority authority

	@Override
	boolean equals(other) {
		if (other instanceof PersonAuthority) {
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

	static PersonAuthority get(long personId, long authorityId) {
		criteriaFor(personId, authorityId).get()
	}

	static boolean exists(long personId, long authorityId) {
		criteriaFor(personId, authorityId).count()
	}

	private static DetachedCriteria criteriaFor(long personId, long authorityId) {
		PersonAuthority.where {
			person == Person.load(personId) &&
			authority == Authority.load(authorityId)
		}
	}

	static PersonAuthority create(Person person, Authority authority, boolean flush = false) {
		def instance = new PersonAuthority(person: person, authority: authority)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(Person u, Authority r) {
		if (u != null && r != null) {
			PersonAuthority.where { person == u && authority == r }.deleteAll()
		}
	}

	static int removeAll(Person u) {
		u == null ? 0 : PersonAuthority.where { person == u }.deleteAll() as int
	}

	static int removeAll(Authority r) {
		r == null ? 0 : PersonAuthority.where { authority == r }.deleteAll() as int
	}

	static constraints = {
	    person nullable: false
		authority nullable: false, validator: { Authority r, PersonAuthority ur ->
			if (ur.person?.id) {
				if (PersonAuthority.exists(ur.person.id, r.id)) {
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
