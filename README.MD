# Zadarma API ruby client

Zadarma CRM docs 

`https://zadarma.com/ru/support/api/`

## Simple Usage
```ruby
zadarma_client = ZadarmaApi::Client.new(key: 'string', secret: 'string')
zadarma_client.call('/info/balance/', 'put', { id: 'YOURSIP', status: 'on'})
```

### Config params

`ZadarmaApi::Client.new(:key, :secret, :sandbox, :api_version)`

option     | type    | description            | default| required
-----------|---------|------------------------|--------|---------
key        | string  | you key                |        | true 
secret     | string  | you secret             |        | true
sandbox    | boolean | enable\desable sandbox | false  | false
api_version| string  | zadarma api version    | v1     | false

### Call params

```ruby
zadarma_client.call(method, request_type, params)
```

option         | type    | description            | default | required
---------------|---------|------------------------|---------|---------
method         | string  | you key                |         | true
request_type   | string  | get, post, put, delete | get     | true
params         | hash    | request params         | {}      | false

