class TriviaQuestion < ApplicationRecord
  validates_presence_of :question, allow_blank: false
  has_many :taggings
  has_many :answers
  has_many :tags, through: :taggings, dependent: :destroy

  belongs_to :user
  attr_accessor :tag_list

  def self.tagged_with(name)
    Tag.find_by_name!(name).trivia_questions
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
