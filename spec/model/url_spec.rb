require 'rails_helper'

RSpec.describe Url do 

  # Validations
   it 'is valid with valid attributes' do
    url = Url.create(original_url: "https://www.google.com/search?q=panda&sxsrf=ALeKk02bMVFQGDfaExjg3liAGJ6NNUbtWA161715sA")
    expect(url).to be_valid
  end

  it "is not valid without an original_url" do
    url = Url.create(original_url: nil)
    expect(url).to_not be_valid
  end

  context "when user input has correct format" do
    it "is not valid with wrong protocol" do
      url = Url.create(original_url: "https://https://google.com")
      expect(url).to_not be_valid 
    end

    it "is not valid without domains" do
      url = Url.create(original_url: "https://")
      expect(url).to_not be_valid 
    end

    it "is not valid without top-level domain" do
      url = Url.create(original_url: "https://google")
      expect(url).to_not be_valid 
    end

    it "is valid with www" do
      url = Url.create(original_url: "https://www.google.com")
      expect(url).to be_valid 
    end

    it "is valid with http" do
      url = Url.create(original_url: "https://www.google.com")
      expect(url).to be_valid 
    end

    it "is valid with https" do
      url = Url.create(original_url: "http://google.com")
      expect(url).to be_valid 
    end
  end
end 