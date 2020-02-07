FactoryBot.define do
  factory :user do
	    name {"test"}
	    email { |n| "test#{n}@example.com"}
	    password {"123456"}
	    introduction {"testです。"}
	end
end