import ma.security.PersonPasswordEncoderListener
// Place your Spring DSL code here


beans = {
    personPasswordEncoderListener(PersonPasswordEncoderListener)
    xmlns context:"http://www.springframework.org/schema/context"

    context.'component-scan'('base-package': "homeland.newspapers.scheduling")
}
