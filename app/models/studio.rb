class Studio < ActiveRecord::Base
  belongs_to :user
  acts_as_gmappable

  STUDIO_TYPES  = ["GRAVACAO", "ENSAIO", "GRAVACAO E ENSAIO"]
  NEIGHBORHOODS = ["Botafogo", "Flamengo", "Jacarepagua"] 

  def gmaps4rails_address
    self.address
  end
  
  def approve
    self.update_attributes(:pending => false)
  end

scope :search, lambda {|busca|
  where("name LIKE ? OR address LIKE ? OR description LIKE ? OR tipo LIKE ?", "%#{busca}%", "%#{busca}%", "%#{busca}%", "%#{busca}%")
}
scope :search_neighborhood, lambda{|neighborhood|
  where(:neighborhood => neighborhood)
}

def show_type
case tipo
when 0 then STUDIO_TYPES[0]
when 1 then STUDIO_TYPES[1]
when 2 then STUDIO_TYPES[2]
when nil then STUDIO_TYPES[2]
end
end
end
