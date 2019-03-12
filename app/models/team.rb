class Team < ApplicationRecord

  has_many :users
  has_many :projects
  has_many :machines
  has_many :materials

end