class UserProfile < ActiveRecord::Base
  belongs_to :user
  has_one :facebook_profile, :through => :user
end
