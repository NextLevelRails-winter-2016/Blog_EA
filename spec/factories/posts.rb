FactoryGirl.define do
    factory :post do
        association :user
        title { 'How to make bacon' }
        article { FFaker::BaconIpsum.phrase }
    end
end
