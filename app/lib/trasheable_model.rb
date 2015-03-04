module TrasheableModel

  def self.included(k)
    k.scope :all_actives, -> {k.where(active: true)}
  end
    
  def inactivate
    self.active = false
    save
  end
  
end