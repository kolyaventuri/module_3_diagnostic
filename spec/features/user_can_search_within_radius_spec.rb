# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
require 'rails_helper'

context 'As a user, when I visit \'/\'' do
  context  'and fill in the search form (using 80203) and click locate' do
    let(:zip) { '80203' }
    let(:valid_types) { ['Electric', 'Propane'] }
    let(:attributes) { ['name', 'address', 'fuel-type', 'distance', 'access-times'] }

    scenario 'I should see the 10 closest stations in 6 miles, sorted by distance' do
      visit '/'

      fill_in 'q', with: zip
      click_on 'Locate'

      expect(current_path).to eq('/search')

      within('.stations tbody') do
        stations = find_all('tr')

        expect(stations.length).to be(10)
        last = -1

        stations.each do |station|
          within(station) do
            distance = find('[data-attribute="distance"]').gsub(/\d*\.\d*/, '').to_f
            expect(last).to be < distance
            last = distance
          end
        end
      end
    end

    scenario 'the stations should be limited to Electric and Propane' do
      visit '/'

      fill_in 'q', with: zip
      click_on 'Locate'

      within('.stations .tbody') do
        stations = find_all('tr')

        stations.each do |station|
          within(station) do
            type = find('[data-attribute="fuel-type"]')

            expect(type.text).to include(page.body)
          end
        end
      end
    end

    scenario 'I should see the stations name, address, fuel types, distance, and access times' do
      visit '/'
      fill_in 'q', with: zip
      click_on 'Locate'

      within('.stations .tbody') do
        stations = find_all('tr')

        stations.each do |station|
          within(station) do
            attributes.each do |attribute|
              data = find("[data-attribute='#{attribute}']")
              expect(data.text).to_not be_empty
            end
          end
        end
      end
    end
  end
end
