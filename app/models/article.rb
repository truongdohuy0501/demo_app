require 'elasticsearch/model'

class Article < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  # searchkick
  searchkick word_start: [:title], highlight: [:title]
  # searchkick autocomplete: [:title]
  # searchkick  highlight: [:title]

  has_many :posts,  dependent: :destroy
  validates :title, presence: true, uniqueness: true

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
