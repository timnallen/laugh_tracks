require 'rails_helper'

describe 'As A User' do
  describe 'When I visit /comedians' do
    before :each do
      @john = Comedian.create(name: "John Mulaney", city: "Chicago", age: 34, img_url: "https://upload.wikimedia.org/wikipedia/commons/9/9c/John_Mulaney_at_PaleyFest_2014.jpg")
      @jerry = Comedian.create(name: "Jerry Seinfeld", city: "New York City", age: 60, img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/1024px-Jerry_Seinfeld_2016_-_2.jpg")
      @new_in_town = @john.specials.create(name: "New In Town", runtime: 58)
      @comeback = @john.specials.create(name: "Comeback Kid", runtime: 62)
      @seinfeld = @jerry.specials.create(name: "Seinfeld", runtime: 30)
      @whats_the_deal = @jerry.specials.create(name: "What's The Deal With That", runtime: 58)
    end

    it 'shows me a list of comedians with their names, ages, and cities' do

      visit '/comedians'

      within('.comedians') do
        expect(page).to have_content(@john.name)
        expect(page).to have_content(@john.age)
        expect(page).to have_content(@john.city)
        expect(page).to have_css("img[src*='#{@john.img_url}']")
        expect(page).to have_content("Total number of specials: ")
        expect(page).to have_content(@jerry.name)
        expect(page).to have_content(@jerry.age)
        expect(page).to have_content(@jerry.city)
        expect(page).to have_css("img[src*='#{@jerry.img_url}']")
      end
    end

    it 'shows me all comedians specials and their runtimes and count' do
      visit '/comedians'

      within("#comedian-#{@john.id}") do
        expect(page).to have_content(@new_in_town.name)
        expect(page).to have_content(@new_in_town.runtime)
        expect(page).to have_content(@comeback.name)
        expect(page).to have_content(@comeback.runtime)
        expect(page).to have_content("Total number of specials: 2")
      end

      within("#comedian-#{@jerry.id}") do
        expect(page).to have_content(@seinfeld.name)
        expect(page).to have_content(@seinfeld.runtime)
        expect(page).to have_content(@whats_the_deal.name)
        expect(page).to have_content(@whats_the_deal.runtime)
        expect(page).to have_content("Total number of specials: 2")
      end
    end

    it 'can filter by age' do
      visit '/comedians?age=34'

      expect(page).to_not have_content(@jerry.name)
    end

    it 'shows me statistics for average age and unique cities' do
      visit '/comedians'

      within('#statistics') do
        expect(page).to have_content('Statistics')
        expect(page).to have_content('Average Age: 47')
        expect(page).to have_content('List of Cities: ')
        expect(page).to have_content('Chicago')
        expect(page).to have_content('New York City')
      end
    end

    it 'shows me statistics for average age and unique cities correctly by filter' do
      visit '/comedians?age=34'

      within('#statistics') do
        expect(page).to have_content('Statistics')
        expect(page).to have_content('Average Age: 34')
        expect(page).to have_content('List of Cities: ')
        expect(page).to have_content('Chicago')
        expect(page).to_not have_content('New York City')
      end
    end

    it 'shows me statistics for number of specials and average run time' do
      visit '/comedians'

      within('#statistics') do
        expect(page).to have_content('Total number of specials: 4')
        expect(page).to have_content('Average Run Time: 52')
      end
    end

    it 'shows me statistics for number of specials and average run time correctly by filter' do
      visit '/comedians?age=34'

      within('#statistics') do
        expect(page).to have_content('Total number of specials: 2')
        expect(page).to have_content('Average Run Time: 60')
      end
    end
  end
end
