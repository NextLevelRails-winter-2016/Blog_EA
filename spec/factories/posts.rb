FactoryGirl.define do
  factory :post do
    association :user
    title {FFaker::BaconIpsum.word}
    article {FFaker::BaconIpsum.phrase}

  end
end
