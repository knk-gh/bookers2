class BooksController < ApplicationController

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
  		redirect_to book_path(@book.id), notice:'Book was successfully create.'
		else
 		render :new
 		end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		# @user = User.find(params[:id])
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

end
