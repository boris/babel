class Editor < ActiveRecord::Base
  belongs_to :country,
    :foreign_key => "countries_id"
end
