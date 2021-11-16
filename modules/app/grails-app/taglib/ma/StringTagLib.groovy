package ma

import org.apache.commons.lang.StringUtils

class StringTagLib {

  /**
   * Tag library namespace
   *
   * @since 0.1.0
   */
  static namespace = 'str'

  def abbr = { attrs, body ->
    String fullString = attrs.value?.toString()
    Integer maxLength = Integer.parseInt(attrs?.maxLength?.toString() ?: "50")
    String stringToShow = StringUtils.substring(fullString, 0, maxLength)
    String ellipes = fullString?.size() > maxLength ? "..." : ""

    out << "${stringToShow}${ellipes}"
  }
}
