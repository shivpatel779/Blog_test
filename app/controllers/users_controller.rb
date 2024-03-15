class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  #Api for create user
  def create_user
    user = User.new(user_params)
    if user.save
     render json: { message: 'User created successfully' }, status: :created
    else
     render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to posts_path(user_id: user.id)
    end
  end

  def login_new
  end

  #Api for User login
  def user_login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     render json: { message: 'Login successful', user_id: user.id }, status: :ok
    else
     render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      redirect_to posts_path(user_id: @user)
    else
      redirect_to :posts, error: 'Invalid email or password'
    end
  end

  def logout
    reset_session
    redirect_to login_new_path(user_id: @user)
  end

  def logout_user
    reset_session
    render json: {message: "Logout successfully"}, status: :ok
  end

  private

  def user_params
   params.permit(:email, :password)
  end

end