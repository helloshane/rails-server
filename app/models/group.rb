class Group < ApplicationRecord
  has_many :user_groups, class_name: "UserGroup"
  has_many :users, through: :user_groups
end
