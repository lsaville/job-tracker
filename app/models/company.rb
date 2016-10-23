class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.ordered
    order(:city)
  end

  def self.top_three
    crazy = Company.all.group_by do |company|
      company.jobs.average(:level_of_interest).round
    end
    crazy.sort[-3..-1].reverse
  end
end
