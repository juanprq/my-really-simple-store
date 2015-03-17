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

  def self.create_trash(record)
    trashed_record = TrashedRecord.new
    trashed_record.record_type = record.class.name
    trashed_record.record_id = record.id
    trashed_record.record_name = record.name_for_trash
    trashed_record.record_content = record.to_json
    trashed_record.save
  end

  def restore
    record = find_base_model
    record.update_attribute :active, true
    self.destroy
  end

  def eliminate
    record = find_base_model
    record.destroy
    self.destroy
  end

  private

    def find_base_model
      base_model = Object::const_get self.record_type
      base_model.find self.record_id
    end

end
