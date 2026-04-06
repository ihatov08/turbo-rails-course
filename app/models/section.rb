class Section < ApplicationRecord
  belongs_to :course
  validates :name, presence: true
end
