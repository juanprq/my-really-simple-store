# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string
#  identification :string
#  created_at     :datetime
#  updated_at     :datetime
#

class Client < ActiveRecord::Base
	
end
