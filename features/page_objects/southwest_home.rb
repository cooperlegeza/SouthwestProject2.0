require 'page-object'
require 'watir-webdriver'

class SouthwestHome
  include PageObject
  page_url 'www.southwest.com'

  text_field(:departure_date_full, :class => 'js-depart-date-dup')
  text_field(:departure_date, :id => 'air-date-departure')
  text_field(:return_date, :id => 'air-date-return')
  text_field(:departure_location, :id => 'air-city-departure')
  text_field(:arrival_location, :id => 'air-city-arrival')
  button(:search, :id => 'jb-booking-form-submit-button')

  def testing_date
    puts self.departure_date_full_element.attribute('value')
  end

end