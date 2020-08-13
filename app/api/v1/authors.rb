module V1
  class Authors < Grape::API
    resources :authors do

      desc '一覧'
      get '/' do
        @authors = Author.all
      end

      desc '詳細'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @author = Author.find_by(id: params[:id])
      end

      desc '作成'
      params do
        requires :name, type: String
      end
      post '/' do
        @author = Author.create(name: params[:name])
      end

      desc '削除'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @author = Author.find_by(id: params[:id])
        @author.destroy
      end
    end
  end
end
