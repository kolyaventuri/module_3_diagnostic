# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

contet 'As a user, when I visit \'/\'' do
  context 'and fill in the search form (using 80203) and click locate' do
    let(:zip) { '80203' }
    let(:valid_types) { ['Electric', 'Propane'] }

    scenario 'I should see the 10 closest stations in 6 miles, sorted by distance' do
      visit '/'

      fill_in 'q', with: zip
      click_on 'Locate'

      expect(current_path).to eq('/search')

      within('.stations tbody') do
        stations = find_all('tr')

        expect(stations.length).to be(10)

        stations.each do |station|
          within(station) do
            type = find('[data-attribute="fuel-type"]')

            expect(type.text).to include(page.body)
          end
        end
      end
    end
  end
end
