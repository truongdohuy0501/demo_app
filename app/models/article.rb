require 'elasticsearch/model'

class Article < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  searchkick

  has_many :posts,  dependent: :destroy
  validates :title, presence: true, uniqueness: true
  # validates :facts, presence: true
  class << self
    def query(params)
      articles = self.active_record_search(params) # filter by other parameters first

      # return right there if search is blank

      # otherwise pass already filtered set to elastic search for further filtering
      article_ids = articles.pluck(:id)
      self.elastic_search(params, article_ids)
    end

    def elastic_search(params, listing_ids)
      elastic_query = {
        query: query&.first,
        fields: ['title^10', 'text']
      }
  
      self.search(params[:search], elastic_query)
    end
  end


  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       query: {
  #         multi_match: {
  #           query: query&.first,
  #           fields: ['title^10', 'text']
  #         }
  #       }
  #     }
  #   )
  # end
  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :title, analyzer: 'english'
  #     indexes :text, analyzer: 'english'
  #   end
  # end
  # Article.__elasticsearch__.create_index!
  # Article.import # for auto sync model with elastic search
end
