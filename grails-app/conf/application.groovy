grails.gorm.default.mapping = {
    cache true
    version false
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'ma.security.Person'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'ma.security.PersonAuthority'
grails.plugin.springsecurity.authority.className = 'ma.security.Authority'
grails.plugin.springsecurity.requestMap.className = 'ma.security.Requestmap'
grails.plugin.springsecurity.securityConfigType = 'Requestmap'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.plugin.springsecurity.logout.postOnly = false

grails.plugin.karman.serveLocalStorage = true
grails.plugin.karman.serveLocalMapping = 'storage'
grails.plugin.karman.storagePath = '/tmp'
grails.plugin.karman.defaultFileACL = com.bertramlabs.plugins.karman.CloudFileACL.PublicRead