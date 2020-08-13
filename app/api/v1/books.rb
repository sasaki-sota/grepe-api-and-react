module V1
  class Books < Grape::API
    resources :books do

      desc '一覧'
      get '/' do
        @books = Book.all
      end

      desc '詳細'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @books = Book.find(params[:id])
      end

      desc '作成'
      params do
        requires :title, type: String
        requires :price, type: Integer
        requires :author_id, type: Integer
      end
      post '/' do
        @books = Book.create(
          title: params[:title],
          price: params[:price],
          author_id: params[:author_id]
        )
      end
    end
  end
end
