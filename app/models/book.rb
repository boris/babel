class Book < ActiveRecord::Base
  validates :title, :author, presence: true,
    length: { minimum: 1 }
end
