class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    user1 = User.all
    #render json: {message: current_user}, message: users
    pp current_user
    render json: user1
  end

  def create
    user1 = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user1.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user1.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user1 = User.find(params[:id])
    if user1
      render json: user1
    else
      render json: {}, status: :unauthorized
    end
  end

end
