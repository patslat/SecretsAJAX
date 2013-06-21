class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(
      friender_id: current_user.id,
      friendee_id: params[:user_id]
    )

    if @friendship.save
      render :json => @friendship
    end
  end

  def destroy
    friendship = Friendship.where(:friender_id => current_user.id,
                                  :friendee_id => params[:user_id]).first
    friendship.destroy
    render :json => true

  end
end
