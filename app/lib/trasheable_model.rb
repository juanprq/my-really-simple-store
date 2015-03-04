module TrasheableModel

  def self.included(k)
    k.scope :all_actives, -> {k.where(active: true)}
  end
    
  def inactivate
    self.active = false
    save
  end

  def name_for_trash
    name = self.try(:name)
    if name.nil or name.empty?
      name = "#{self.class.name}-#{self.id}"
    end
    name
  end
  
end