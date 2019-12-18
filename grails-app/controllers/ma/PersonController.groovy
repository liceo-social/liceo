package ma

import ma.person.CameFrom
import ma.person.Country
import ma.person.DocumentType
import ma.person.Genre

class PersonController {

  static scaffold = Person

  /**
   * Required data to render creation form
   *
   * @since 0.1.0
   */
  def create() {
    return [
        person: new Person(),
        genreList: Genre.list(),
        cameFromList: CameFrom.list(),
        countries: Country.list(),
        documentTypes: DocumentType.list()
    ]
  }
}
