# Tell the adapter what data you want serialized
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :body
  has_one :post
end
