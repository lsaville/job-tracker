require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        company = Company.create(name: "ESPN", city: "Burbs")
        category = Category.create(title: "Blah")
        job = Job.new(level_of_interest: 80, description: "Wahoo", company: company, category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        company = Company.create(name: "ESPN", city: "Burbs")
        category = Category.create(title: "Blah")
        job = Job.new(title: "Herding Cats", description: "Wahoo", company: company, category: category)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        company = Company.create(name: "ESPN", city: "Burbs")
        category = Category.create(title: "Blah")
        job = Job.new(title: "Herding Cats", level_of_interest: 80, description: "Wahoo", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.create(name: "ESPN", city: "Burbs")
      category = Category.create(title: "Blah")
      job = Job.new(title: "Herding Cats", level_of_interest: 80, description: "Wahoo", company: company, category: category)
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      company = Company.create(name: "ESPN", city: "Burbs")
      category = Category.create(title: "Blah")
      job = Job.new(title: "Herding Cats", level_of_interest: 80, description: "Wahoo", company: company, category: category)
      expect(job).to respond_to(:category)
    end

    it "has many comments" do
      company = Company.create(name: "ESPN", city: "Burbs")
      category = Category.create(title: "Blah")
      job = Job.new(title: "Herding Cats", level_of_interest: 80, description: "Wahoo", company: company, category: category)
      expect(job).to respond_to(:comments)
    end
  end
end
