class SalesDatum < ActiveRecord::Base
  belongs_to :user
  @@products = { "c" => "Classico", "x" => "Confianca", "s" => "Saliente", "a" => "Aroma", "y" => "Certeza", "f" => "Familia", "g" => "?" }

  
  def self.products
    @@products
  end

end
