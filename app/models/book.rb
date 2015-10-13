class Book < ActiveRecord::Base
  validates :title, :author, presence: true,
    length: { minimum: 1 }

  has_many :author
  has_one :country
  accepts_nested_attributes_for :author, :country
end
