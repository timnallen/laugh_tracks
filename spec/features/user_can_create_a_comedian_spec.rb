require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /comedians/new' do
    before :each do
      visit '/comedians/new'
    end

    it 'shows me a form with name age and city' do
      expect(page).to have_field("Name")
      expect(page).to have_field("Age")
      expect(page).to have_field("City")
    end

    it 'allows me to submit, redirects me and the new data appears on the page' do
      fill_in 'Name', with: 'Jim Gaffigan'
      fill_in 'Age', with: 52
      fill_in 'City', with: 'Chicago'

      click_button 'Create Comedian'

      expect(current_path).to eq('/comedians')
      expect(page).to have_content('Jim Gaffigan')
      expect(page).to have_content(52)
    end
  end
end
