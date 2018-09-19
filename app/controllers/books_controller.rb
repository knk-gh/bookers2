class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@books = Book.all
		if @book.save
  		redirect_to book_path(@book.id), notice:'Book was successfully create.'
		else
 		render :index
 		end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@bookf = Book.find(params[:id])
		@book = Book.new
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
  		redirect_to book_path(@book.id), notice:'Book was successfully update.'
		else
 		render :new
 		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

private
    def book_params
      params.require(:book).permit(:book_title, :book_opinion)
    end

	def correct_user
		book = Book.find(params[:id])
		if current_user.id != book.user.id
	    redirect_to books_path
	  end
	end

end
