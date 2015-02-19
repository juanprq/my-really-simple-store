require 'rails_helper'

RSpec.describe Invoice, type: :model do

  before :example do
    @invoice = FactoryGirl.build :invoice
    # get the detail
    invoice_detail = FactoryGirl.build :invoice_detail
    invoice_detail.product = FactoryGirl.build :product

    @invoice.invoice_details = [invoice_detail]
    @invoice.admin = FactoryGirl.build :admin
    @invoice.client = FactoryGirl.build :client
  end
  
  it 'valid' do
    expect(@invoice).to be_valid
  end

  it 'fail with no client' do
    expect(FactoryGirl.build(:invoice, client: nil)).to be_invalid
  end

  it 'fail with no admin' do
    expect(FactoryGirl.build(:invoice, admin: nil)).to be_invalid
  end

  it 'fail with no total' do
    expect(FactoryGirl.build(:invoice, total: nil)).to be_invalid
  end

  it 'fail with no invoice_detail' do
    @invoice.invoice_details = []
    expect(@invoice).to be_invalid
  end

end
