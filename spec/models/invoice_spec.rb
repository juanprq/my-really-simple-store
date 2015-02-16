require 'rails_helper'

RSpec.describe Invoice, type: :model do
  
  it 'valid' do
    expect(FactoryGirl.build(:invoice)).to be_valid
  end

  it 'fail with no client' do
    expect(FactoryGirl.build(:invoice, client: nil)).to be_invalid
  end

  it 'fail with no admin' do
    expect(FactoryGirl.build(:invoice, admin: nil)).to be_invalid
  end

  it 'failt with no total' do
    expect(FactoryGirl.build(:invoice, total: nil)).to be_invalid
  end

end
