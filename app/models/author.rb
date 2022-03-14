class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates_presence_of :first_name
  validates_presence_of :sur_name
  validates_presence_of :birth_year
end
