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

    it 'shows me all comedians specials and their runtimes' do
      john = Comedian.create(name: "John Mulaney", city: "Chicago", age: 34)
      jerry = Comedian.create(name: "Jerry Seinfeld", city: "New York City", age: 60)
      new_in_town = john.specials.create(name: "New In Town", runtime: 58)
      comeback = john.specials.create(name: "Comeback Kid", runtime: 62)
      seinfeld = jerry.specials.create(name: "Seinfeld", runtime: 30)
      whats_the_deal = jerry.specials.create(name: "What's The Deal With That", runtime: 58)

      visit '/comedians'

      within("#comedian-#{john.id}") do
        expect(page).to have_content(new_in_town.name)
        expect(page).to have_content(new_in_town.runtime)
        expect(page).to have_content(comeback.name)
        expect(page).to have_content(comeback.runtime)
      end

      within("#comedian-#{jerry.id}") do
        expect(page).to have_content(seinfeld.name)
        expect(page).to have_content(seinfeld.runtime)
        expect(page).to have_content(whats_the_deal.name)
        expect(page).to have_content(whats_the_deal.runtime)
      end
    end
  end
end
