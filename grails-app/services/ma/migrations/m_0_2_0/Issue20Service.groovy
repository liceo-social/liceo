package ma.migrations.m_0_2_0

import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j
import ma.Person
import ma.person.Sex

@Slf4j
@Transactional
class Issue20Service {

  void load() {
    boolean isThereAnySex = Sex.count() > 0
    boolean areTherePeople = Person.count() > 0

    /*
     * if there is no entries in sex table and there are people
     * we need to set sex attribute for every person
     */
    if (!isThereAnySex && areTherePeople) {
      def pending = new Sex(name: 'Pendiente', code: 'pending').save(flush: true)

      Person.list().each { Person person ->
        person.sex = pending
        person.save(flush: true)
      }
      /*
       * If the database is still empty we can add some default sex entries
       */
    } else if (!(isThereAnySex || areTherePeople)) {
      def sexList = [
        [name: 'Hombre', code: 'man'],
        [name: 'Mujer', code: 'woman']
      ]

      sexList.each {sex -> new Sex(sex).save(flush: true) }

      log.debug("sex migration done")
    }
  }
}
