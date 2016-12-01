require 'page-object'
require 'watir-webdriver'

class SouthwestSearchResults
  include PageObject

  attr_accessor = :full_date,'carouselfulldate'

  DATE_FORMATTER = '%Y/%m/%d'
  FULL_DATE = 'carouselfulldate'

  list_item(:departure_date, :id => 'carouselTodayDepart')
  list_item(:return_date, :id => 'carouselTodayReturn')
  list_items(:selectable_dates_not_today, :class => 'carouselEnabledSodaIneligible')
  list_items(:unselectable_dates_full, :class => 'carouselDisabled')

  def highlighted_departure_date
    date_string_to_day_and_month_string(self.departure_date_element.attribute(FULL_DATE))
  end

  def highlighted_return_date
    date_string_to_day_and_month_string(self.return_date_element.attribute(FULL_DATE))
  end

  def string_to_date(date_string)
    Date.strptime(date_string, DATE_FORMATTER)
  end

  def date_string_to_day_and_month_string(full_date_string)
    string_to_date(full_date_string).strftime('%m/%d')
  end

  def selectable_dates
    selectable_dates_all = []
    self.selectable_dates_not_today_elements.each do |date|
      selectable_dates_all << string_to_date(date.attribute(FULL_DATE))
    end
    selectable_dates_all << string_to_date(self.departure_date_element.attribute(FULL_DATE))
    selectable_dates_all << string_to_date(self.departure_date_element.attribute(FULL_DATE))
    selectable_dates_all
  end

  def unselectable_dates
    unselectable_dates_all = []
    self.unselectable_dates_full_elements.each do |date|
      string = date.attribute(FULL_DATE)
      unselectable_dates_all << string_to_date(date.attribute(FULL_DATE))
    end
    unselectable_dates_all
  end

end
