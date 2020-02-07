require 'rails_helper'

RSpec.describe Cloth, type: :model do
	describe 'バリデーション' do
		describe 'NG' do
			it 'brandがなければ登録できない' do
				expect(FactoryBot.build(:cloth, brand: "")).to_not be_valid
			end

			it 'category_idがなければ登録できない' do
				expect(FactoryBot.build(:cloth, category_id: "")).to_not be_valid
			end

			it 'user_idがなければ登録できない' do
				expect(FactoryBot.build(:cloth, user_id: "")).to_not be_valid
			end

			it 'sizeがなければ登録できない' do
				expect(FactoryBot.build(:cloth, size: "")).to_not be_valid
			end

			it 'sizeが11文字以上だと登録できない' do
				expect(FactoryBot.build(:cloth, size: "12345678901")).to_not be_valid
			end
		end
	end
end