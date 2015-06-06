FactoryGirl.define do
  factory :post do
    author { Faker::Company::name }
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }

    factory :post_invalid do
      author nil
    end

  end
end
