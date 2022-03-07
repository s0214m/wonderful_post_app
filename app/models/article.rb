class Article < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles
  belongs_to :user

  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") :all
  end

end
