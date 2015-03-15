class Dog < ActiveRecord::Base
  has_many :toys
  belongs_to :user

  has_many :vets, through: :appointments
  has_many :appointments
end
