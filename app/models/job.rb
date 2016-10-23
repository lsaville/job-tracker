class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.ordered_level_of_interest
    group(:level_of_interest).order(level_of_interest: :desc).count
  end
end
