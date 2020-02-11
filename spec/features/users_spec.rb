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

		feature "機能確認" do
			feature "update" do
				before do
					visit edit_user_path(@user1)
					find_field('user[name]').set('updated_name')
					find_field('user[introduction]').set('updated_introduction')
					# find('input[type="file"]').set('no_image.png')
					find("input[name='commit']").click
				end

				# scenario "updateされているか" do
				# 	expect(page).to have_content "updated_name"
			 #        expect(page).to have_content "updated_inttroduction"
			 #        expect(User.find(1).profile_image_id).to be_truthy
				# end

				scenario "リダイレクト先" do
					expect(page).to have_current_path user_path(@user1)
				end
			end

			feature "無効なデータでのupdate" do
				before do
					visit edit_user_path(@user1)
					find_field('user[name]').set(nil)
					find("input[name='commit']").click
				end

				scenario "リダイレクト先" do
					expect(page).to have_current_path user_path(@user1)
				end

				scenario "エラーメッセージ" do
					expect(page).to have_content "blank"
				end
			end
		end
	end
end