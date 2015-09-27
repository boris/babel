class Country < ActiveRecord::Base
  has_many :author
  has_many :editor
end
