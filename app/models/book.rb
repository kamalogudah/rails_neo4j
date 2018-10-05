class Book 
  include Neo4j::ActiveNode
  property :isbn, type: String
  property :title, type: String
  property :year_published, type: Integer

  has_one :in_or_out_or_both, :author, type: :FILL_IN_RELATIONSHIP_TYPE_HERE
  has_one :in_or_out_or_both, :category, type: :FILL_IN_RELATIONSHIP_TYPE_HERE


end
