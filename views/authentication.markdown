# Authentication

Uceem's API uses an `auth_token` for authentication, every request made to the Uceem API will require one.  These tokens are managed on a per-user level, so you will need to authenticate to the Uceem API with a `POST` that contains your valid Uceem email and password.

### Retrieving the token

A successful request would be similar to the following:

```bash
$ curl -X POST -d "email=user@example.com" \ 
               -d "password=password" \
               https://uceem.com/api/login.json
```

With the response:

```json
{
  "auth_token": "<YOUR_TOKEN>"
}
```

A valid response will have the status 200, and an `auth_token` key in the response body. Now that you've secured your token, you will be able to make other requests to the Uceem API. Just be sure to include `auth_token=my_token` as a parameter, otherwise we don't know it's you.

The Uceem gem can take care of all of this for you, with one simple call that takes the email and password as parameters:

```ruby
require 'uceem'

Uceem::Authentication.begin_session('user@example.com', 'password') # => 'your_secret_auth_token'
```