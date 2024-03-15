# The Model View Controller (MVC) Pattern

GET /about HTTP/1.1
Host: 127.0.0.1

## Routes
Matchers for the URL that is requested

Get for "/about"

I see you requested "/about", we'll givbe that to the AboutController to handle

## Models
Database wrapper

User
* query for records
* wrap individual records

## Views
Your response body content
* HTML
* CSV
* PDF
* XML

## Controllers
Decide how to provess a request and define a response