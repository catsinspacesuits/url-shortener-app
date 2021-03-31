class Url < ApplicationRecord
  before_validation :generate_slug
  validates :original_url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, message: "Please use a regular format" }
  validates_presence_of :short_url, :original_url

  def generate_slug
    self.short_url =  SecureRandom.uuid[0..5] 
  end
end
