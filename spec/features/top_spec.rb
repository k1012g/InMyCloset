require 'rails_helper'

RSpec.feature "Top", type: :feature do
	before do
		@user1 = FactoryBot.create(:user)
		@user2 = FactoryBot.create(:user)
	end

	feature "未ログイン" do
		feature "リンク確認" do
			scenario "topページ" do
				visit root_path
				expect(page).to have_current_path root_path
			end

			scenario "aboutページ" do
				visit about_path
				expect(page).to have_current_path about_path
			end

			scenario "confirmページ" do
				visit confirm_path
				expect(page).to have_current_path confirm_path
			end

			scenario "othersページ" do
				visit others_path(@user1)
				expect(page).to have_current_path new_user_session_path
			end
		end
	end

	feature "ログイン済" do
		before do
	      login(@user1)
	    end
		feature "リダイレクト確認" do
			scenario "topページ" do
				visit root_path
				expect(page).to have_current_path root_path
			end

			scenario "aboutページ" do
				visit about_path
				expect(page).to have_current_path about_path
			end

			scenario "confirmページ" do
				visit confirm_path
				expect(page).to have_current_path user_path(@user1)
			end

			feature "othersページ" do
				scenario "othersページ" do
					visit others_path(@user1)
					expect(page).to have_current_path others_path(@user1)
				end

				scenario "他人のothersページにアクセスできず、マイページにリダイレクトされる" do
					visit others_path(@user2)
					expect(page).to have_current_path others_path(@user1)
				end
			end
		end
	end
end