require 'rails_helper'

describe Contact do
  describe "validations" do
    context "valid attributes" do
      it "is valid with all attributes" do
        contact = Contact.new(first_name: "Fran", last_name: "Peabody", position: "Head Honcho", email: "fran@company.com", company_id: 1)
        expect(contact).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without first name" do
        contact = Contact.new(last_name: "Peabody", position: "Head Honcho", email: "fran@company.com", company_id: 1)
        expect(contact).to be_invalid
      end

      it "is invalid without last name" do
        contact = Contact.new(first_name: "Fran", position: "Head Honcho", email: "fran@company.com", company_id: 1)
        expect(contact).to be_invalid
      end

      it "is invalid without position" do
        contact = Contact.new(first_name: "Fran", last_name: "Peabody", email: "fran@company.com", company_id: 1)
        expect(contact).to be_invalid
      end

      it "is invlid without email" do
        contact = Contact.new(first_name: "Fran", last_name: "Peabody", position: "Head Honcho", company_id: 1)
        expect(contact).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new
      expect(contact).to respond_to(:company)
    end
  end
end
