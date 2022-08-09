# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTML method
  * the /hello
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

 Challenge
Request:
POST http://localhost:9292/sort-names

With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe




## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Post title</h1>
    <div>Post content</div>
  </body>
</html>
```

```html
<!-- EXAMPLE -->
<!-- Response when the post is not found: 404 Not Found -->

<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>We couldn't find this post. Have a look at the homepage?</div>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:



# expected response:
Hello Leo
Response for 200 OK
```

```
query: 
GET '/hello?name=Harry'
 
# expected response: 
404 ok 
```

```
query: 
GET '/hello?name=Harry'
 
# expected response: 
404 ok 
```

```
query: 
POST '/sort-names'

With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
```


## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
      response = POST('/names?name=Joe&name=Alice&name=Zoe&name=Kieran&name=Julia')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

end

```
query: 
POST '/sort-names'

With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
```

end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
