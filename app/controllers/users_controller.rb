class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:email, :password, :full_name, :status)
  end

  def show
    # Unused.
  end

  def index
    # User dashboard.
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.save
      flash[:notice] = "#{@user.full_name} was successfully created."
      flash[:color] = "valid"
    else
      flash[:notice] = "Could not create #{@user.full_name}"
      flash[:color] = "invalid"
    end
    redirect_to users_path
  end

  def edit
    # Admin only.
  end

  def update
    # Do we even use this?
  end

  def destroy
    # Delete from DB.
  end
  
  def login
    puts params
    user_email = params[:user][:email]
    user = User.find_by(email: user_email)
    if user == nil
      flash[:notice] = "Could not find #{user_email}, try again."
      redirect_to home_path
    else
      puts user
      redirect_to users_path
    end
  end
end
