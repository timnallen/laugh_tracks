class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name, :age, :city, :img_url

  def self.filter_by_age(age_params)
    case age_params
    when nil
      all
    else
      where(age: age_params)
    end
  end
end
