grails.gorm.default.mapping = {
    cache true
    version false
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'ma.security.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'ma.security.UserAuthority'
grails.plugin.springsecurity.authority.className = 'ma.security.Authority'
grails.plugin.springsecurity.requestMap.className = 'ma.security.Requestmap'
grails.plugin.springsecurity.securityConfigType = 'Requestmap'
grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.databasemigration.updateOnStart = true
grails.plugin.databasemigration.updateOnStartFileName = 'changelog.groovy'
