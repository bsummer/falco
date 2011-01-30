class ConnectionsController < ApplicationController
    protect_from_forgery :only => [:create, :update, :destroy]
  # GET all connections
    def index
      @users = User.all
      render :json => @users, :callback => params[:callback]
    end

    # POST controllers_url
    def create
      render :json => {:error => 'No code for creating a connection yet.'}, :callback => params[:callback]
    end

    # GET connection_url ( :id => 1 )
    def show
      render :json => {:error => 'This is the show.'}, :callback => params[:callback]
    end

    # GET edit_connection_url
    def edit
      # return an HTML form for editing the account
    end

    # PUT connection_url ( :id => 1 )
    def update
      # find and update the account
    end

    # DELETE connection_url ( :id => 1 )
    def destroy
      render :json => {:error => 'No code for destroying a connection yet.'}, :callback => params[:callback]
    end

    def like
      if (params[:id].blank? || params[:guid].blank?)
        render :json => {:error => 'Missing parameter: required guids'}, :callback => params[:callback], :status => :unprocessable_entity
        return
      end
      u = User.find_by_userguid(params[:guid])
      s = User.find_by_userguid(params[:id])

      if (u.nil? || s.nil?)
        render :json => {:error => 'Unknown user'}, :callback => params[:callback], :status => :unprocessable_entity
        return
      end
      c1 = u.connections.find_or_initialize_by_selected_user_id(s.id)
      c2 = s.connections.find_or_initialize_by_selected_user_id(u.id)

      c1.selection_state = "I_LIKE" if c1.new_record?
      c1.selection_state = "MATCH" if (c1.selection_state == "LIKES_ME")
      c1.save

      c2.selection_state = "LIKES_ME" if c2.new_record?
      c2.selection_state = "MATCH" if (c2.selection_state == "I_LIKE")
      c2.save

      render :json => c2, :callback => params[:callback]
    end

    def unlike
      if (params[:id].blank? || params[:guid].blank?)
        render :json => {:error => 'Missing parameter: required guids'}, :callback => params[:callback], :status => :unprocessable_entity
        return
      end
      u = User.find_by_userguid(params[:guid])
      s = User.find_by_userguid(params[:id])

      if (u.nil? || s.nil?)
        render :json => {:error => 'Unknown user'}, :callback => params[:callback], :status => :unprocessable_entity
        return
      end
      c1 = u.connections.find_by_selected_user_id(s.id)
      c2 = s.connections.find_by_selected_user_id(u.id)

      c1.destroy if (c1.selection_state == "I_LIKE")
      c1.selection_state = "LIKES_ME" if (c1.selection_state == "MATCH")
      c1.save if (!c1.destroyed)

      c2.delete if (c2.selection_state == "LIKES_ME")
      c2.selection_state = "I_LIKE" if (c2.selection_state == "MATCH")
      c2.save if (!c2.destroyed)

      render :json => c1, :callback => params[:callback]
    end

end

