require 'rails_helper'

RSpec.describe Special, type: :model do
  describe 'relationships' do
    it { should belong_to :comedian }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :runtime }
  end
end
