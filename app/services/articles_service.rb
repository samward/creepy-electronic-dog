class ArticlesService
  def self.call
    new.call
  end

  def call
    fetch_article_data

    parsed_articles.map do |article_json|
      Article.find_or_create_from_json(article_json)
    end
  end

  private

  def parsed_articles
    JSON.parse(@response)
  end

  def fetch_article_data
    uri = URI("https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v2.json")
    @response = Net::HTTP.get(uri)
  end
end
