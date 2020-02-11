require 'rails_helper'

RSpec.feature "Searches", type: :feature do
	before do
		@user1 = FactoryBot.create(:user)
	end

	feature "未ログイン" do
		feature "リンク確認" do
			scenario "searchページ" do
				visit search_path
				expect(page).to have_current_path search_path
			end
		end
	end

	feature "ログイン済" do
		before do
			login(@user1)
		end

		feature "リンク確認" do
			scenario "searchページ" do
				visit search_path
				expect(page).to have_current_path search_path
			end
		end
	end
end