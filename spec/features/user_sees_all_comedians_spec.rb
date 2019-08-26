require 'rails_helper'

describe 'As A User' do
  describe 'When I visit /comedians' do
    it 'shows me a list of comedians with their names, ages, and cities' do
      john = Comedian.create(name: "John Mulaney", city: "Chicago", age: 34)
      jerry = Comedian.create(name: "Jerry Seinfeld", city: "New York City", age: 60)

      visit '/comedians'

      within('.comedians') do
        expect(page).to have_content(john.name)
        expect(page).to have_content(john.age)
        expect(page).to have_content(john.city)
        expect(page).to have_content(jerry.name)
        expect(page).to have_content(jerry.age)
        expect(page).to have_content(jerry.city)
      end
    end
  end
end
