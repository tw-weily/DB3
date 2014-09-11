class UsersController < ApplicationController
	
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    #render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    #render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params(params[:user]))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params(params[:user]))
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
  
  def splatts
	@user = User.find(params[:id])

	render json: @user.splatts
  end
  
  # GET /users/follows/1
  # GET /users/follows/1.json
  def show_follows
	@user = User.find(params[:id])
	render json: @users.follows
  end
  
  # GET /users/followers/1
  # GET /users/followers/1.json
  def show_followers
	@user = User.find(params[:id])
	render json: @users.followers
  end
  
  # POST /users/follows
  # POST /users/follows.json
  def add_follows
	@user = User.find(params[:id])
	@followed_User = User.find(params[:follows_id])
	
	if @user.follows << followed_User
      render json: @user.follows, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def delete_follows
	@user = User.find(params[:id])
	@user2 = User.find(params[:follows_id])
	
	if @user.follows.delete(@user2)
		render json: @user.follows, status: :deleted, location: @user
	else
		render json: @user.errors, status: :unprocessable_entity
	end
  end
  
  # GET /users/splatts-feed/1
  def splatts_feed
	@feed = splatt.find_by_sql('Select splatts.body, splatts.user_id, splatts.id, splatts.created_at FROM splatts JOIN follows ON follows.followed_id=splatts.user_id WHERE follows.follower_id=#{params[:id]} ORDER BY created_at DESC')
	render json: @feed
  end
  
  private
  def user_params(params)
	params.permit(:email, :password, :name, :blurb)
  end
  
  def set_headers
	headers['Access-Control-Allow-Origin'] = '*';
  end
end
