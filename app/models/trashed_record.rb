# == Schema Information
#
# Table name: trashed_records
#
#  id             :integer          not null, primary key
#  record_type    :string
#  record_id      :integer
#  record_content :string
#  record_name    :string
#  created_at     :datetime
#  updated_at     :datetime
#

class TrashedRecord < ActiveRecord::Base
  
end
