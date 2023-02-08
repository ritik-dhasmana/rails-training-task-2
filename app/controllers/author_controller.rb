class AuthorController < ApplicationController
    skip_before_action :verify_authenticity_token

    
    def index
        # author and his books
        if params[:id] 
            author = Author.find(params[:id])
            books = author.books 
            res = {
                author: "nil",
                books: "nil"
            }
            res["author"] = author ;
            res["books"] = books;
            render json: res
        else
            render json: Author.all()
        end
    end 

    def create
        author = Author.create(name: params[:name], email: params[:email], phone: params[:phone], date_of_birth: params[:date_of_birth]);
        render json: author
    end

    def update
        author = Author.find(params[:id])
        if(params[:name])
            author.name = params[:name]
        end
        if params[:email]
            author.email = params[:email]
        end
        if params[:phone]
            author.phone = params[:phone]
        end
        if params[:date_of_birth]
            author.date_of_birth = params[:date_of_birth]
        end
        author.save
        render json: author
    end
    def delete
        author = Author.find(params[:id])
        render json: author.destroy()
    end
end
