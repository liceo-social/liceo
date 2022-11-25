package ma.person

import grails.databinding.BindingFormat
import grails.validation.Validateable

import ma.Person

/**
 * Commands holding data for disabling deactivating a person
 *
 * @since 0.2.0
 */
class DisableCommand implements Validateable {

  /**
   * {@link Person} to deactivate
   *
   * @since 0.2.0
   */
  Person person

  /**
   * A little explanation behind deactivating
   * this person
   *
   * @since 0.2.0
   */
  String motivation

  /**
   * Fecha de baja solicitada
   *
   * @since 0.5.3
   */
  @BindingFormat("MM/dd/yyyy")
  Date deactivationDate
}
