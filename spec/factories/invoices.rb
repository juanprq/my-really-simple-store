FactoryGirl.define do
  factory :invoice do
    total 20000
    admin FactoryGirl.build(:admin)
    client FactoryGirl.build(:client)
  end
end