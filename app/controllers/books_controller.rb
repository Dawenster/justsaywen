class BooksController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN_USERNAME'], :password => ENV['ADMIN_PASSWORD'], :except => [:index, :show, :quotes_and_motivations]

  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    years = []
    year = Time.now.year
    until year == 2009
      years << year
      year -= 1
    end
    @books = {}
    years.each do |year|
      books_of_the_year = Book.where(:year => year).order("created_at DESC")
      @books[year] = books_of_the_year unless books_of_the_year.empty?
    end
  end

  def show
    @book = Book.find_by_slug(params[:slug])
    all_books = Book.order("created_at DESC")
    all_books.each_with_index do |book, i|
      next unless @book == book
      if i == all_books.size - 1
        @next_book = Book.first
      else
        @next_book = all_books[i + 1]
      end
    end
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(books_params)
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update_attributes(books_params)
    redirect_to books_path
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def quotes_and_motivations
    @next_book = Book.last
  end

  private

  def books_params
    params.require(:book).permit(:title, :image, :author, :review, :total_pages, :pages_read, :year)
  end
end