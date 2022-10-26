# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
    let(:app) { Application.new }



  context "GET to /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello World")
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Tom", message: "Hello World!")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Tom, you sent this message: 'Hello World!'")
    end
  end

  context "GET to /names" do
    it "returns 200 OK with the right content" do
      response = get("/names", names: "Julia, Mary, Karim")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST to /sort-names" do
    it 'returns 200 OK and names sorted' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')
      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  context "GET to /hello" do
    it 'contains Hello! in the web page' do
      response = get('/hello')
  
      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
end