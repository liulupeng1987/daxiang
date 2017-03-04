class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :brand
  has_many :photos
  accepts_nested_attributes_for :photos

  def onsale!
    self.onsale = true
    self.save
  end

  def notsale!
    self.onsale = false
    self.save
  end

end
