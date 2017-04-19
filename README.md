## Ruby on Rails API Consumption assignment
This repository was create to demonstrate an API Consumption application.

### Booleans.io
The API that is being consumed is from [https://booleans.io](https://booleans.io) (Booleans as a Service - Baas) Because everyone needs to use a service to store their boolean values :-).

I ended up using [httparty](https://github.com/jnunemaker/httparty) for the API consuption, along side some model callbacks. I originally looked at using [ActiveRestClient](https://github.com/whichdigital/active-rest-client) to provide "model" like functionality, but that was a joke. The model being used is keeping a record of the booleans created, but the value in the database is compared to the value via the BaaS when a specific boolean is viewed.

### Giphy.com
There is also a small interface with [giphy's api](http://api.giphy.com) which will pull 1 image from the top 30 results of querying for `true` or `false`. Sometimes they really don't make a lot of sense, but that is giphy for you.

### Design
I've never claimed to be amazing at UX/UI, so I used [zurb's foundation](http://foundation.zurb.com) for some quick and dirty styles.
