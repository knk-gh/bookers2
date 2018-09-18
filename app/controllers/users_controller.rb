class UsersController < ApplicationController
	before_action :authenticate_user!
	
  def show
    @book = Book.new
  	@user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :profile_intro, :profile_image)
  end


end
