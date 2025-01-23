class BooksController < ApplicationController

	def create
		book = Book.new(book_params)
		if book.save 
			render json: {message: "Book created successfully"}, status: :created
	    else
	     	render json: {errors: "Book not created"}, status: :unprocessable_entity
	     end
	end

	def index 
		books = Book.all 
		render json: books
    end		

    def update 
    	book = Book.find_by(id: params[:id])
    	if book&.update(book_params)
    		render json: {message: " Book updated successfully", book: book}
    	else
    		render json:{error: "unable to update book"}, status: :unprocessable_entity
    	end	
    end

    def show
    	book = Book.find_by(id: params[:id])
    	if book
    	   render json: book
    	else
    		render json: {error: "book not found"}, status: :not_found
    	end
    end 

    def destroy
    	book = Book.find_by(id: params[:id])
    	if book.destroy
    		render json: {message: "Book deleted successfully"}
    	else
    		render json: {error: "Unable to delete book"}, status: :unprocessable_entity
    	end
    end	

    def book_params
    	params.permit(:name, :number_of_pages)
    end	
end
