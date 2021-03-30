class Url < ApplicationRecord
  before_validation :generate_slug
  validates :original_url, format: URI::regexp(%w[http https])

  def generate_slug
    self.short_url =  SecureRandom.uuid[0..5] 
  end
end
