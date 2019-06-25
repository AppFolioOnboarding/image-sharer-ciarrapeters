require 'uri'

class Image < ApplicationRecord
  acts_as_taggable

  validates :url, presence: true
  validate :must_be_valid_url
  validates :url, format: { with: /\.(png|jpg|jpeg)\Z/i }

  private

  def must_be_valid_url
    uri = URI.parse(url)
    errors.add(:url, 'must be a valid url') if uri.host.nil?
  end
end
