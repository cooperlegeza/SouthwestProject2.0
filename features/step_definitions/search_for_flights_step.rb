require 'page-object'

include PageObject::PageFactory

COLUMBUS_AIRPORT_CODE = 'CMH'
ORLANDO_AIRPORT_CODE = 'MCO'

When(/^I search for a flight using the default$/) do
  visit_page SouthwestHome do
  end

  on_page SouthwestHome do |page|
    @departure_date = page.departure_date
    @return_date = page.return_date
    page.departure_location = COLUMBUS_AIRPORT_CODE
    page.arrival_location = ORLANDO_AIRPORT_CODE
    sleep 2
    page.search
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page SouthwestSearchResults do |page|
    highlighted_departure_date = page.highlighted_departure_date
    highlighted_return_date = page.highlighted_return_date
    expect(highlighted_departure_date).to eq @departure_date
    expect(highlighted_return_date).to eq @return_date
  end
end

And(/^I can't choose a departure date from the past$/) do
  on_page SouthwestSearchResults do |page|
    selectable_dates = page.selectable_dates
    unselectable_dates = page.unselectable_dates
    selectable_dates.each do |selectable_date|
      expect(selectable_date).to be >= Date.today
    end
    unselectable_dates.each do |unselectable_date|
      expect(unselectable_date).to be < Date.today
    end
  end
end