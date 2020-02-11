require 'rails_helper'

RSpec.feature "Users", type: :feature do
	before do
		@user1 = FactoryBot.create(:user)
		@user2 = FactoryBot.create(:user)
	end

	feature "未ログイン" do
		feature "リンク確認" do
			scenario "showページ" do
				visit user_path(@user1)
				expect(page).to have_current_path user_path(@user1)
			end

			scenario "editページ" do
				visit edit_user_path(@user1)
				expect(page).to have_current_path new_user_session_path
			end

			scenario "followページ" do
				visit follow_path(@user1)
				expect(page).to have_current_path follow_path(@user1)
			end
		end
	end

	feature "ログイン済" do
		before do
			login(@user1)
		end

		feature "リンク確認" do
			feature "showページ" do
				scenario "showページ" do
					visit user_path(@user1)
					expect(page).to have_current_path user_path(@user1)
				end

				scenario "他人のマイページにアクセス可能" do
					visit user_path(@user2)
					expect(page).to have_current_path user_path(@user2)
				end
			end

			feature "editページ" do
				scenario "editページ" do
					visit edit_user_path(@user1)
					expect(page).to have_current_path edit_user_path(@user1)
				end

				scenario "他人のeditページにアクセスできず、マイページにリダイレクトされる" do
					visit edit_user_path(@user2)
					expect(page).to have_current_path user_path(@user1)
				end
			end

			feature "followページ" do
				scenario "followページ" do
					visit follow_path(@user1)
					expect(page).to have_current_path follow_path(@user1)
				end

				scenario "他人のfollowページにアクセスできる" do
					visit follow_path(@user2)
					expect(page).to have_current_path follow_path(@user2)
				end
			end
		end
	end
end