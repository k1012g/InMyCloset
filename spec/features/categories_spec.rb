require 'rails_helper'

RSpec.feature "Categories", type: :feature do
	before do
		@user1 = FactoryBot.create(:user)
		@category1 = FactoryBot.create(:category)
	end

	feature "未ログイン" do
		feature "リンク確認" do
			scenario "showページ" do
				visit category_path(@category1)
				expect(page).to have_current_path category_path(@category1)
			end
		end
	end

	feature "ログイン済" do
		before do
			login(@user1)
		end

		feature "リンク確認" do
			scenario "showページ" do
				visit category_path(@category1)
				expect(page).to have_current_path category_path(@category1)
			end
		end
	end
end