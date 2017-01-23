require 'page-object'
require 'watir-webdriver'

class SouthwestHome
  include PageObject
  page_url 'www.southwest.com'

  DEPARTURE_DATE_ID = 'air-date-departure'
  RETURN_DATE_ID = 'air-date-return'
  DEPARTURE_LOCATION_ID = 'air-city-departure'
  ARRIVAL_LOCATION_ID = 'air-city-arrival'
  SEARCH_ID = 'jb-booking-form-submit-button'

  text_field(:departure_date, :id => DEPARTURE_DATE_ID)
  text_field(:return_date, :id => RETURN_DATE_ID)
  text_field(:departure_location, :id => DEPARTURE_LOCATION_ID)
  text_field(:arrival_location, :id => ARRIVAL_LOCATION_ID)
  button(:search, :id => SEARCH_ID)

end