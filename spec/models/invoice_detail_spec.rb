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
    @invoice_detail.quantity = nil
    expect(@invoice_detail).to be_invalid
  end

  it 'fail with no price' do
    @invoice_detail.price = nil
    expect(@invoice_detail).to be_invalid
  end

  it 'fail with no points' do
    @invoice_detail.points = nil
    expect(@invoice_detail).to be_invalid
  end

  it 'fail with no product' do
    @invoice_detail.product = nil
    expect(@invoice_detail).to be_invalid
  end

  it 'fail with no invoice' do
    @invoice_detail.invoice = nil
    expect(@invoice_detail).to be_invalid
  end

  it 'calculate total' do
    total = @invoice_detail.price * @invoice_detail.quantity
    expect(@invoice_detail.total).to be == total
  end

  it 'calculate total points' do
    total_points = @invoice_detail.points * @invoice_detail.quantity
    expect(@invoice_detail.total_points).to be == total_points
  end

end
