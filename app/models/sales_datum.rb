class SalesDatum < ActiveRecord::Base
  belongs_to :user
  @@products = { "c" => "Classico", "x" => "Confianca", "s" => "Saliente", "a" => "Aroma", "y" => "Certeza", "f" => "Classico 12", "g" => "Saliente 14" }
  @@conversions = { "c" => 72, "x" => 72, "s" => 72, "a" => 72, "y" => 50, "f" => 192, "g" => 48 }
  
  def self.products
    @@products
  end

  def self.conversions
    @@conversions
  end
end
