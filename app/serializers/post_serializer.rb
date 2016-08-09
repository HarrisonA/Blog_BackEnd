# Tell the adapter what data you want serialized
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :comments
end
