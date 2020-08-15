module V1
  class Books < Grape::API
    resources :books do
      desc "一覧"
      get "/" do
        @books = Book.all
        present @books, with: V1::Entities::BookEntity
      end

      desc "詳細"
      params do
        requires :id, type: Integer
      end
      get "/:id" do
        @books = Book.find(params[:id])
        present @book, with: V1::Entities::BookEntity
      end

      desc "作成"
      params do
        requires :title, type: String
        requires :price, type: Integer
        requires :author_id, type: Integer
      end
      post "/" do
        @books = Book.create(
          title: params[:title],
          price: params[:price],
          author_id: params[:author_id]
        )

        if @book.save
          status 201
          present @book, with: V1::Entities::BookEntity
        else
          status 400
          present @book.errors
        end
      end
    end
  end
end
