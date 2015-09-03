class UserRolesController < ApplicationController
  before_action :set_user_role, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show,:new, :edit, :update, :destroy]
  before_action :require_admin, only: [:index,:show,:new, :edit]
  def index
    @user_roles = UserRole.all
  end

  def show
  end

  def new
    @user_role = UserRole.new
  end

  def create
    @user_role = UserRole.new(user_role_params)
    if @user_role.save
      redirect_to @user_role
    else
      render 'new'
    end   
  end

  def edit 
  end

  def update
    if @user_role.save
      redirect_to @user_role
    else
      render 'edit' 
    end
  end

  def destroy
  end

  private
  def set_user_role
    @user_role = UserRole.find(params[:id])
  end

  def user_role_params
    params.require(:user_role).permit(:name)
  end
end
