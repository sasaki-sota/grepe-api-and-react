module V1
  module Entities
    class BookEntity < Grape::Entity
      expose :id
      expose :title
      expose :price
      expose :tax_included_price do |instance, options| # ブロックを渡す事ができる。
        instance.price * 1.1
      end
      expose :author, using: V1::Entities::AuthorEntity
    end
  end
end
