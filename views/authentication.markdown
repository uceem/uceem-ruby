#Authentication

Uceem's API uses an `auth_token` for authentication, every request made to the Uceem API will require one.  These tokens are managed on a per-user level, so you will need to authenticate to the Uceem API with a `POST` that contains your valid Uceem email and password.

###Retrieving the token

A successful request would be similar to the following:

```bash
  POST https://www.uceem.com/api/login.json?email=test@example.com&password=super_secret
```

A valid response will have the status 200, and an `auth_token` in the response body.  The token itself can be accessed with something similar to the following method in Ruby:

```ruby
def get_uceem_auth_token
  response = RestClient.post 'https://uceem.com/api/login',
                                email: 'test@example.com', 
                                password: 'super_secret', 
                                content_type: :json,
                                accept: :json
                                  
  response.body['auth_token'] if response.code == 200
end
```

The Uceem gem can take care of all of this for you, with one simple call:

```ruby
require 'uceem'

Uceem::Authentication.begin_session
# => 'your_secret_auth_token'
```

Now that you've secured your token, you will be able to make other requests to the Uceem API. Just make sure to include `auth_token=my_token` as a parameter, otherwise we don't know it's you.

###Getting an error

There are three HTTP Status Codes you can end up with when an error occurs:

  - 400: Bad Request, typically from missing parameters
  - 401: Unauthorized, you provided an invalid email or password.
  - 500: Server Error, something went wrong on our end.

If you receive a 400 or 401 error, make sure that you provided the correct credentials, and that you're successfully registered as a Uceem user.  If you result in a 500 error, there was a problem on our end, so try again in a few moments.  When a 500 error persists, please contact <support@uceem.com> immediately.