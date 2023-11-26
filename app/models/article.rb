class Article < ApplicationRecord
  validates :title, presence: true

  def self.fetch_github_articles(file_path)
    token = Rails.application.credentials.github[:access_token]
    client = Octokit::Client.new(:access_token => token)
    base64_content = client.contents('kenchasonakai/farao_tech_memo', path: file_path).dig(:content)
    Base64.decode64(base64_content).force_encoding('utf-8')
  end

  def self.create_article_from_github(file_path)
    article_text = fetch_github_articles(file_path)
    title = article_text.match(/# (.*)/)[1]
    content = article_text.gsub(/# #{title}/, '')
    Article.create(title: title, content: content)
  end
end
