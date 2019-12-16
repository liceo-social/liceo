package ma.security

import com.bertramlabs.plugins.selfie.Attachment
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

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

    static attachmentOptions = [
        photo: [
            styles: [
                thumb: [width: 50, height: 50, mode: 'fit'],
                medium: [width: 250, height: 250, mode: 'scale']
            ]
        ]
    ]

    static embedded = ['photo']

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        photo nullable: true, contentType: ['png','jpg'], fileSize:1024*1024
    }

    static mapping = {
	    password column: '`password`'
    }
}
