FactoryGirl.define do
  factory :question do
    title     { FFaker::Lorem.words }
    body      { FFaker::Lorem.paragraph }
    user
  end

end
