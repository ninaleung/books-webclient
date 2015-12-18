class Book
  attr_accessor :id, :title, :author, :publisher, :genre, :year

  def initialize(input_options)
    @id = input_options["id"]
    @title = input_options["title"]
    @author = input_options["author"]
    @publisher = input_options["publisher"]
    @genre = input_options["genre"]
    @year = input_options["year"]
  end

  def year_publisher
    "#{@year} " + "#{@publisher}"
  end

  def self.find_by(input_options)
    id = input_options[:id]
    book_options = Unirest.get("http://localhost:3000/books/#{id}.json").body
    Book.new(book_options)
  end

  def self.all
    book_options_hashes = Unirest.get("http://localhost:3000/books.json").body
    book = []
    book_options_hashes.each do |book_options_hash|
      book << Book.new(book_options_hash)
    end
    book
  end

  def destroy
    Unirest.delete("http://localhost:3000/books/#{id}.json").body
  end

  def self.create(input_options)
    employee_options_hash = Unirest.post(
      "http://localhost:3000/books.json",
      headers: {"Accept" => "application.json"},
      parameters: input_options
    ).body
    Book.new(employee_options_hash)
  end

  def update(input_options)
    Unirest.patch(
      "http://localhost:3000/books/#{id}.json",
      headers: {"Accept" => "application.json"},
      parameters: input_options
    ).body
  end
end