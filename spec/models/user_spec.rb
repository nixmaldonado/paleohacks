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

# Vote Question test!

  describe '#upvote_question!'do
    before do
      @user     = FactoryGirl.create(:user)
      @question = FactoryGirl.create(:question)
  end

    context 'when question has no votes' do
      before do
        @user.upvote_question!(@question)
      end
    end

      it 'upvotes a question' do
        result = @user.question_votes.find_by_id(@question)
        expect(result).to eq(@question)
      end
  end

end
