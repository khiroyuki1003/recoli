require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end

  context 'リスト作成できる時' do
    it '全ての項目が正しく入力されていれば作成できる' do
      expect(@list).to be_valid
    end
    it 'list_detailが空でも作成できる' do
      list_detail = ""
      expect(@list).to be_valid
    end
    it 'priorityが選択されていなくても作成できる' do
      priority_id = 1
      expect(@list).to be_valid
    end
  end

  context 'リスト作成できない時' do
    it 'list_titleが空だと保存できない' do
      @list.list_title = ''
      @list.valid?
      expect(@list.errors.full_messages).to include("List title can't be blank")
    end
  end
end


# bundle exec rspec spec/models/list_spec.rb 

# binding.pry

# @list.errors.full_messages
