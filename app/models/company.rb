class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.ordered
    order(:city)
  end

  def self.top_three
    company_avg = Company.all.group_by do |company|
      company.jobs.average(:level_of_interest).round
    end
    length_check(company_avg.sort.reverse)
  end

  def self.length_check(sorted_averages)
    if sorted_averages.count >= 3
      sorted_averages[0..2]
    elsif sorted_averages.count == 2
      sorted_averages[0..1]
    else
      sorted_averages
    end
  end
end
