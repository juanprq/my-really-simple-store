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
    @invoice.client = nil
    expect(@invoice).to be_invalid
  end

  it 'fail with no admin' do
    @invoice.admin = nil
    expect(@invoice).to be_invalid
  end

  it 'fail with no total' do
    @invoice.total = nil
    expect(@invoice).to be_invalid
  end

  it 'fail with no total points' do
    @invoice.total_points = nil
    expect(@invoice).to be_invalid
  end

  it 'fail with no invoice_detail' do
    @invoice.invoice_details = []
    expect(@invoice).to be_invalid
  end

  it 'calculate_total' do
    total =  @invoice.invoice_details.map(&:total).reduce(&:+)
    @invoice.save
    expect(@invoice.total).to be == total
  end

  it 'calculate_total_points' do
    total_points = @invoice.invoice_details.map(&:total_points).reduce(&:+)
    @invoice.save
    expect(@invoice.total_points).to be == total_points
  end

end
