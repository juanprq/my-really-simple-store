require 'rails_helper'

RSpec.describe InvoiceDetail, type: :model do
  
  before :example do
    @invoice_detail = FactoryGirl.build(:invoice_detail)
    @invoice_detail.product = FactoryGirl.build(:product)
    @invoice_detail.invoice = FactoryGirl.build(:invoice)
  end

  it 'valid' do
    expect(@invoice_detail).to be_valid
  end

  it 'fail with no quantity' do
    expect(FactoryGirl.build(:invoice_detail, quantity: nil)).to be_invalid
  end

  it 'fail with no price' do
    expect(FactoryGirl.build(:invoice_detail, price: nil)).to be_invalid
  end

  it 'fail with no points' do
    expect(FactoryGirl.build(:invoice_detail, points: nil)).to be_invalid
  end

  it 'fail with no product' do
    expect(FactoryGirl.build(:invoice_detail, product: nil)).to be_invalid
  end

  it 'fail with no invoice' do
    expect(FactoryGirl.build(:invoice_detail, invoice: nil)).to be_invalid
  end

end
