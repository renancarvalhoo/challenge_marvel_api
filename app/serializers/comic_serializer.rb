class ComicSerializer
  include ActiveModel::Serializers::JSON
  attr_accessor :name, :description
end
