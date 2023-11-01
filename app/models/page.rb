class Page < ApplicationRecord
  validates :url, presence: true

  has_many :page_links
end
