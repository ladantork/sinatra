

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

  context "GET /hello" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/hello?name=Leo')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Leo")
    end
  end

    context "GET /names" do
      it 'returns the names' do
        # Assuming the post with id 1 exists.
        response = get('/names?name=Julia&name=Mary&name=Karim')
  
        expect(response.status).to eq(200)
         expect(response.body).to eq('Julia, Mary, Karim')
      end
     end

     context "POST /sort-names" do
      it "returns same list of names, sorted alphabetically" do
        response = post('/sort-names', names:'Joe,Alice,Zoe,Julia,Kieran')
  
        expect(response.status).to eq(200)
        expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
      end
    end

     it 'returns 404 Not Found' do
       response = get('/chairs?name=Julia&name=Mary&name=Karim')

      expect(response.status).to eq(404)
     end
     
  
end