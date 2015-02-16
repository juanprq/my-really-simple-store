require 'rails_helper'

RSpec.describe Admin, type: :model do
  # --- test for the validations
  it 'valid' do
  	expect(FactoryGirl.build(:admin)).to be_valid
  end

  it 'fail with no name' do
  	expect(FactoryGirl.build(:admin, name: '')).to be_invalid
  end

  it 'fail with no phone' do
  	expect(FactoryGirl.build(:admin, phone: '')).to be_invalid
  end

  it 'fail with no identification' do
  	expect(FactoryGirl.build(:admin, identification: '')).to be_invalid
  end

  it 'fail digits phone validation' do
  	expect(FactoryGirl.build(:admin, phone: 'invalid')).to be_invalid
  end

  it 'fail digits identification validation' do
  	expect(FactoryGirl.build(:admin, identification: 'invalid')).to be_invalid
  end

  it 'invoices' do
    expect(FactoryGirl.build(:admin, invoices: [FactoryGirl.build(:invoice), FactoryGirl.build(:invoice)]).invoices.size).to be == 2
  end
end