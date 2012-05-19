class Studio < ActiveRecord::Base
  belongs_to :user

  STUDIO_TYPES  = ["GRAVACAO", "ENSAIO", "GRAVACAO E ENSAIO"]
  NEIGHBORHOODS = ["Botafogo", "Flamengo", "Jacarepagua"] 

  def approve
    self.update_attributes(:pending => false)
  end

scope :search, lambda {|busca|
  where("name LIKE ? OR address LIKE ? OR description LIKE ? OR type LIKE ?", "%#{busca}%", "%#{busca}%", "%#{busca}%", "%#{busca}%")
}
scope :search_neighborhood, lambda{|neighborhood|
  where(:neighborhood => neighborhood)
}
end
