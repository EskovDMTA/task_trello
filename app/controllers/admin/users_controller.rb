class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, only: %i[ show edit update ]

  def show
  end

  def edit
  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.order(:type).order(:id).page(params[:page]).per(10)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_url
      else
        render :new_admin_user_url
      end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :type)
  end

end