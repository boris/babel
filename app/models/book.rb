class Book < ActiveRecord::Base
  validates :title, :author, presence: true,
    length: { minimum: 1 }

  def country_code
    country_code = country.to_s
  end

  def country_name
    country = ISO3166::Country[country_code]
#    country.translations[I18n.locale.to_s] || country.name
  end

  acts_as_taggable_on :tags

end
