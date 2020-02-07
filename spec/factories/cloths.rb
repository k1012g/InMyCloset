FactoryBot.define do
	factory :cloth do
		user_id {1}
		category_id {1}
		brand {"test"}
		size {"test"}
		# image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/no_image.png'))
	end
end