class DashboardController < ApplicationController
  def index
    @jobs = Job.all
    @top_three = Company.top_three
  end
end
