package ma.person

import grails.databinding.BindingFormat

trait PersonalInformation {
    String name
    String firstSurname
    String secondSurname
    Genre genre
    Country nationality
    String regionOfBirth
    Country culturalUpbringing
}
