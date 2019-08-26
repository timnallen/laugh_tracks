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
    it 'filter_by_age' do
      john = Comedian.create(name: "John Mulaney", city: "Chicago", age: 34, img_url: "https://upload.wikimedia.org/wikipedia/commons/9/9c/John_Mulaney_at_PaleyFest_2014.jpg")
      jerry = Comedian.create(name: "Jerry Seinfeld", city: "New York City", age: 60, img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/1024px-Jerry_Seinfeld_2016_-_2.jpg")
      expect(Comedian.filter_by_age(34)).to eq([john])
      expect(Comedian.filter_by_age(nil)).to eq([john, jerry])
    end
  end
end
