class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def index
  	@books = Book.all.order("id ASC")
  	@book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  	  flash[:notice] = "successfully"
  	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      flash[:notice] = "successfully updated"
  	  redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	flash[:notice] = "successfully destroyed"
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
