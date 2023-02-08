class BookController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index 
        # books = Book.all()
        if params[:id]
            render json: Book.find(params[:id])
        else
            books  = Book.all()
            render json: books.to_json( include: [:author] )
        end
    end

    def create 
        author = Author.find(params[:author_id])
        book = author.books.create(title: params[:title], content: params[:content], isbn: params[:isbn], published_at: params[:published_at], number_of_pages: params[:pages]);
        render json: book 
    end

    def update
        book = Book.find(params[:id])
        if(params[:title])
            book.title = params[:title]
        end
        if params[:content]
            book.content = params[:content]
        end
        if params[:isbn]
            book.isbn = params[:isbn]
        end
        if params[:published_at]
            book.published_at = params[:published_at]
        end
        if params[:number_of_pages]
            book.number_of_pages = params[:number_of_pages]
        end
        book.save
        render json: book
    end
    
    def delete
        render json: Book.destroy_by(id: params[:id])
    end
end
