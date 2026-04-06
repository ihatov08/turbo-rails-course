class Section < ApplicationRecord
  belongs_to :course
  has_many :lectures, dependent: :destroy
  validates :name, presence: true
end
