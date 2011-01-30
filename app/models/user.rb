class User < ActiveRecord::Base
  require 'uuidtools'

  before_create :assign_uuid

  has_one :user_profile
  has_one :facebook_profile
  has_many :connections

  def self.get_filtered(gender, minbirthday, pagesize = 5, start = 0)
    User.find(:all, :joins => :user_profile, :conditions => ["birthday <= ? and sex = ? and email is not null", minbirthday, gender], :limit => pagesize, :offset => start)
  end

  def assign_uuid
    self.userguid = UUIDTools::UUID.random_create.to_s
  end
end

