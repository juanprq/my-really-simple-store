require 'rails_helper'

RSpec.describe Client, type: :model do
  
  it 'valid' do
  	expect(FactoryGirl.build(:client)).to be_valid
  end

  it 'fail with no name' do
    expect(FactoryGirl.build(:client, name: '')).to be_invalid
  end

  it 'fail with no phone' do
    expect(FactoryGirl.build(:client, phone: '')).to be_invalid
  end

  it 'fail with no identification' do
    expect(FactoryGirl.build(:client, identification: '')).to be_invalid
  end

  it 'fail with chars in phone' do
    expect(FactoryGirl.build(:client, phone: 'invalid')).to be_invalid
  end

  it 'fail with chars in identification' do
    expect(FactoryGirl.build(:client, identification: 'asddqwd')).to be_invalid
  end
end
