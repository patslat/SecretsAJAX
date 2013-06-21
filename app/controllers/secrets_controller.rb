class SecretsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => Secret.all }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @tags = Tag.all
    @secret = Secret.new
  end

  def create

    @secret = current_user.authored_secrets.build(
      recipient_id: params[:user_id],
      title: params[:secret][:title]
    )
    @secret.tag_ids = params[:secret][:tag_ids]
    @secret.save


    respond_to do |format|
      format.json { render :json => @secret }
    end

  end
end
