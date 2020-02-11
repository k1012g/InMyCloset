FactoryBot.define do
  factory :user do
	    name {"test"}
	    email { |n| "test#{n}@example.com"}
	    password {"123456"}
	    introduction {"testです。"}
	    profile_image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/no_image.png'))}

	    trait :create_with_clothes do
	      after(:create) do |user|
	        create_list(:cloth, 3, user: user)
	      end
	    end
	end
end