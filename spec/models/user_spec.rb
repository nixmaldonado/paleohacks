require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it{ should validate_presence_of(:email) }
    it{ should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:answer_votes) }
    it { should have_many(:question_votes) }
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end

end
