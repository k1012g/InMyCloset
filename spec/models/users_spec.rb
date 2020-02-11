require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'バリデーション' do

		describe 'OK' do
			it "nameとemailとpasswordがあれば登録できる" do
				expect(FactoryBot.create(:user, introduction: "")).to be_valid
			end

			it "passwordが暗号化されているか" do
				user = FactoryBot.create(:user)
				expect(user.password_confirmation).to_not eq "123456"
			end

			it "introductionがなくても保存できる" do
				user = FactoryBot.create(:user, introduction: "")
				expect(user).to be_valid
			end

			it "profile_imageがなくても登録できる" do
				user = FactoryBot.create(:user, profile_image: "")
				expect(user).to be_valid
			end
		end

		describe 'NG' do
			it "nameがなければ登録できない" do
			  expect(FactoryBot.build(:user, name: "")).to_not be_valid
			end

			it "emailがなければ登録できない" do
			  expect(FactoryBot.build(:user, email: "")).to_not be_valid
			end

			it "emailが重複していたら登録できない" do
			  user1 = FactoryBot.create(:user, name: "test1", email: "test@example.com")
			  expect(FactoryBot.build(:user, name: "test2", email: user1.email)).to_not be_valid
			end

			it "passwordがなければ登録できない" do
			  expect(FactoryBot.build(:user, password: "")).to_not be_valid
			end

			it "password_confirmationとpasswordが異なる場合保存できない" do
			  expect(FactoryBot.build(:user, password:"123456", password_confirmation: "123456A")).to_not be_valid
			end

			it "nameが21文字以上だと保存できない" do
				expect(FactoryBot.build(:user, name: "123456789012345678901")).to_not be_valid
			end

			it "introductionが51文字以上だと保存できない" do
				expect(FactoryBot.build(:user, introduction: "123456789012345678901234567890123456789012345678901")).to_not be_valid
			end
		end
	end
end