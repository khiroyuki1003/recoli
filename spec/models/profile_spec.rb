require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  it 'nicknameが空では登録できない' do
    @profile.nickname = ''
    @profile.valid?
    expect(@profile.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'nicknameは20文字以下でないと登録できない' do
    @profile.nickname = '123456789012345678901'
    @profile.valid?
    expect(@profile.errors.full_messages).to include('Nickname is invalid. Please enter at least 20 characters')
  end
  it 'precious_wordは100文字以下でないと登録できない' do
    @profile.precious_word = '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
    @profile.valid?
    expect(@profile.errors.full_messages).to include('Precious word is invalid. Please enter at least 100 characters')
  end
  it 'birth_dateが空では登録できない' do
    @profile.birth_date = nil
    @profile.valid?
    expect(@profile.errors.full_messages).to include("Birth date can't be blank")
  end
end
 

# bundle exec rspec spec/models/profile_spec.rb 

# binding.pry

# @profile.errors.full_messages