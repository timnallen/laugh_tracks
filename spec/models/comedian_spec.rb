require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :city}
    it { should validate_presence_of :img_url}
  end

  describe 'relationships' do
    it { should have_many :specials }
  end

  describe 'class methods' do
    before :each do
      @john = Comedian.create(name: "John Mulaney", city: "Chicago", age: 34, img_url: "https://upload.wikimedia.org/wikipedia/commons/9/9c/John_Mulaney_at_PaleyFest_2014.jpg")
      @jerry = Comedian.create(name: "Jerry Seinfeld", city: "New York City", age: 60, img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/1024px-Jerry_Seinfeld_2016_-_2.jpg")
    end

    it '.filter_by_age' do
      expect(Comedian.filter_by_age(34)).to eq([@john])
      expect(Comedian.filter_by_age(nil)).to eq([@john, @jerry])
    end

    it '.list_of_cities' do
      expect(Comedian.list_of_cities([@john.id])).to eq(["Chicago"])
      expect(Comedian.list_of_cities([@john.id, @jerry.id])).to eq(["Chicago", "New York City"])
    end

    it '.average_age' do
      expect(Comedian.average_age([@john.id, @jerry.id])).to eq(47)
      expect(Comedian.average_age([@john.id])).to eq(34)
    end
  end
end
