require 'rails_helper'

RSpec.feature "Clothes", type: :feature do
	before do
		@category1 = FactoryBot.create(:category)
		@user1 = FactoryBot.create(:user, :create_with_clothes)
		@user2 = FactoryBot.create(:user, :create_with_clothes)
	end

	feature "未ログイン" do
		feature "リンク確認" do
			scenario "newページ" do
				visit new_clothes_path
				expect(page).to have_current_path new_user_session_path
			end

			scenario "editページ" do
				visit edit_clothes_path(@user1.cloths.first)
				expect(page).to have_current_path new_user_session_path
			end
		end
	end

	feature "ログイン済" do
		before do
			login(@user1)
		end
		feature "リンク確認" do
			scenario "newページ" do
				visit new_clothes_path
				expect(page).to have_current_path new_clothes_path
			end

			feature "editページ" do
				scenario "editページ" do
					visit edit_clothes_path(@user1.cloths.first)
					expect(page).to have_current_path edit_clothes_path(@user1.cloths.first)
				end

				scenario "他人のeditページへアクセスできず、マイページへリダイレクトされる" do
					visit edit_clothes_path(@user2.cloths.first)
					expect(page).to have_current_path user_path(@user1)
				end
			end
		end
	end
end