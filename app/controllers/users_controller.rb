class UsersController < ApplicationController
	
	before_action :authenticate_user!


	def new
	end

	def index
		@user = User.all
		@post = Book.new
	end

	def edit
		@user = current_user
	end

	def update
		user = current_user
		if user.update(user_params)
			flash[:ok] = "You have updated user successfully"
			redirect_to user_path(current_user.id)
		else
			@user = current_user
			render action: :edit
		end

	end

	def show
		@user = User.find(params[:id])
		@post = Book.new
		@books = @user.books
	end

	def users
	end

	private

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
