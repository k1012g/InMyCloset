require 'rails_helper'

RSpec.feature "Favorites", type: :feature do
	before do
		@user1 = FactoryBot.create(:user)
		@user2 = FactoryBot.create(:user)
	end

	feature "未ログイン" do
		feature "リンク確認" do
			scenario "showページ" do
				visit user_favorite_path(@user1)
				expect(page).to have_current_path new_user_session_path
			end
		end
	end

	feature "ログイン済" do
		before do
			login(@user1)
		end

		feature "showページ" do
			scenario "showページ" do
				visit user_favorite_path(@user1)
				expect(page).to have_current_path user_favorite_path(@user1)
			end

			scenario "他人のいいねページへアクセスできず、マイページにリダイレクトされる" do
				visit user_favorite_path(@user2)
				expect(page).to have_current_path user_path(@user1)
			end
		end
	end
end