package ma.person

class Address {

    String streetType
    String street
    Integer number
    String ladder
    String floor
    String door
    String neighborhood
    String district
    String postalCode

    String contact1
    String contact2
    String contact3

    static constraints = {
        ladder nullable: true
        contact3 nullable: true
        contact3 nullable: true
    }
}
