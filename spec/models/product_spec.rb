require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'valid' do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  it 'fail with no name' do
    expect(FactoryGirl.build(:product, name: nil )).to be_invalid
  end

  it 'fail with no barcode' do
    expect(FactoryGirl.build(:product, barcode: nil)).to be_invalid
  end

  it 'fail with no price' do
    expect(FactoryGirl.build(:product, price: nil)).to be_invalid
  end

  it 'fail with no stock' do
    expect(FactoryGirl.build(:product, stock: nil)).to be_invalid
  end

  it 'fail with no points' do
    expect(FactoryGirl.build(:product, points: nil)).to be_invalid
  end
  
end
