module V1
  class Authors < Grape::API
    resources :authors do

      desc '一覧'
      get '/' do
        @authors = Author.all
        present @authors, with: V1::Entities::AuthorEntity # @authors を V1::Entities::AuthorEntityを使用して返却する
      end

      desc '詳細'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @author = Author.find_by(id: params[:id])
        present @author, with: V1::Entities::AuthorEntity
      end

      desc '作成'
      params do
        requires :name, type: String
      end
      post '/' do
        @author = Author.create(name: params[:name])

        if @author.save
          status 201
          present @author, with: V1::Entities::AuthorEntity
        else
          status 400
          present @author.errors.full_messages
        end
      end

      desc '削除'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @author = Author.find_by(id: params[:id])
        @author.destroy
        if @author.destroy
          status 204
          present nil
        else
          status 400
          present @author.errors.full_messages
        end
      end
    end
  end
end
