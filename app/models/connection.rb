class Connection < ActiveRecord::Base
  belongs_to :user
  attr_accessor :destroyed
  after_destroy :mark_as_destroyed
  def mark_as_destroyed
    self.destroyed = true
  end

  def self.like(uid, suid)
  end

  def self.unlike(uid, suid)

  end

  def self.find_by_ids(uid, suid)
    where (:user_id => uid, :selected_user_id => suid)
  end

end

