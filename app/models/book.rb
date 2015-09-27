class Book < ActiveRecord::Base
  validates :title, :author, presence: true,
    length: { minimum: 1 }

  belongs_to :author,
    :foreign_key => "authors_id"

  belongs_to :editor,
    :foreign_key => "editors_id"

  belongs_to :borrow,
    :foreign_key => "borrow_id"
end
