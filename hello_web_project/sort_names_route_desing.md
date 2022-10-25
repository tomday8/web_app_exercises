# Sort Names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

Method: POST
Path: /sort-names
Body Parameters: names=Joe,Alice,Zoe,Julia,Kieran


## 2. Design the Response

Response: 200 OK
Response: Alice,Joe,Julia,Kieran,Zoe #names sorted

## 3. Write Examples

```
# Request:

POST /sort-names, names: "Joe,Alice,Zoe,Julia,Kieran"

# Expected response:

Response for 200 OK
"Alice,Joe,Julia,Kieran,Zoe"
```


## 4. Encode as Tests Examples

```ruby


  context "POST /sort-names" do
    it 'returns 200 OK and names sorted' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')
      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
