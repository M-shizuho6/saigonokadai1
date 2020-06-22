class BooksController < ApplicationController
  
  before_action :authenticate_user!


  def index
    @books = Book.all
    @book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
  	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @posts = Book.find(params[:id])
    @user = @posts.user
    @post = Book.new
  end

  def edit
    @post = Book.find(params[:id])
  end

  def update
    @post = Book.find(params[:id])
    @post.update(post_params)
    if @post.update(post_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@post.id)
    else
      @post = @post
      render action: :edit
    end
  end

  def destroy
    @post = Book.find(params[:id])
    @post.destroy
    redirect_to books_path
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
