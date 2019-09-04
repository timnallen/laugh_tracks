require 'rails_helper'

describe 'As A User' do
  describe 'When I visit /comedians' do
    it 'shows me a link that leads to a specific comedians show page' do
      john = Comedian.create(name: "John Mulaney", city: "Chicago", age: 34, img_url: "https://upload.wikimedia.org/wikipedia/commons/9/9c/John_Mulaney_at_PaleyFest_2014.jpg")
      jerry = Comedian.create(name: "Jerry Seinfeld", city: "New York City", age: 60, img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/1024px-Jerry_Seinfeld_2016_-_2.jpg")

      nit = john.specials.create(name: "New In Town", runtime: 58)

      visit '/comedians'

      click_link "John Mulaney"

      expect(current_path).to eq(comedian_path(john))

      expect(page).to have_content(john.name)
      expect(page).to have_content(nit.name)
      expect(page).to have_content(nit.runtime)
      expect(page).to_not have_content(jerry.name)
      expect(page).to_not have_content(jerry.age)
      expect(page).to_not have_content(jerry.city)
    end
  end
end
