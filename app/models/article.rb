class Article < ApplicationRecord
  attr_accessor :raw_json

  def title
    raw_json["title"]
  end
end
