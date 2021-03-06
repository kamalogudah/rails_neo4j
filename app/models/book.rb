class Book < Asset
  id_property :isbn
  property :year_published, type: Integer
  has_one :in, :author, type: :CREATED, model_class: :User
  # has_one :out, :category, type: :HAS_CATEGORY
  has_many :out, :categories, type: :HAS_CATEGORY
  def self.recommendations
    recommendations = all(:book).
                      categories(:category).
                      books(:other_book).
                      where('book <> other_book').
                      query.
                      with('book, other_book, count(category) AS count').
                      where('count > 1').
                      pluck('book.isbn', 'collect(other_book)')

    Hash[*recommendations.flatten(1)]
  end
end
