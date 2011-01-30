class HottiesController < ApplicationController
  @@pageSize = 20
  @@firstRecord = 0

  def index
    @guid = params[:guid]
    @minAge = params[:minAge] || "48"
    @lateBirthday = Time.now.advance(:years => (-1 * @minAge.to_f))
    mydate = Time.parse('07/26/1949')
    @myage = ((Time.now - mydate) / 1.year).floor
    @hotties = User.all
    @users = User.get_filtered('female', @lateBirthday, @@pageSize, @@firstRecord)
    @u12345 = User.find_by_userguid('12345');

    #myguy = User.new({:facebook_id => 1004, :email => 'ghost@boogaloo.com'})
    myguy = User.find_or_initialize_by_email('ghost8@boogaloo.com')
    if (myguy.new_record?)
      myguy.facebook_id = 1015
      myguy.event_key = "skeleton"
      myguy.save
    end
    # @profiles = UserProfile.all(:conditions => {:sex => 'male'})
    # @profiles = UserProfile.joins(:user).where(:users => {:userguid => '12345'}).find(:all, :conditions=>["birthday <= ? and sex = ?", @lateBirthday, 'female'])
    @profiles = UserProfile.find(:all, :joins => :user, :conditions=>["birthday <= ? and sex = ? and email is not null", @lateBirthday, 'female'], :limit => @@pageSize, :offset => @@firstRecord)
  end

  def show
  end

end

