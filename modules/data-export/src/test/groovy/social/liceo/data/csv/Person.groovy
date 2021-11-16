package social.liceo.data.csv

import groovy.transform.builder.Builder

@Builder
class Person {
  String name
  Integer age
  String address
}
