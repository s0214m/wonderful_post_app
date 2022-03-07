class Article < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") :all
  end

end
