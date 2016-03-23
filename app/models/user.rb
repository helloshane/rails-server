class User < ActiveRecord::Base
  has_many :user_groups, class_name: "UserGroup"
  has_many :groups, through: :user_groups

end
