class Article < ApplicationRecord
  has_many :likes, as: :likeable

  attr_accessor :raw_json

  def self.find_or_create_from_json(json)
    find_or_initialize_by(external_id: json["id"]).tap do |record|
      record.raw_json = json
      record.save
    end
  end

  def like!
    likes.create!
  end

  def title
    raw_json["title"]
  end

  def description
    raw_json["description"]
  end

  def image_src
    raw_json.dig("photos", 0, "files", "medium")
  end

  def external_likes_count
    raw_json.dig("reactions", "likes").to_i
  end

  def likes_count
    likes.count + external_likes_count
  end
end
