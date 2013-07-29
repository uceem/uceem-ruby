# The Uceem API

##### _The following describes the official Uceem API v1._

Uceem's API allows you to interact with anything that can send an HTTP request.  The JSON format will be used for all data to and from the API.  The API is REST-based, so the URLs are relative to the resource and simple to identify. The API accepts the request methods of `GET`, `POST`, `PUT`, and `DELETE`.

_Consider the following primary actions available to the `User` resource:_

<table class='pure-table pure-table-horizontal'>
  <thead>
    <tr>
      <th>Action</th>
      <th>Request Method</th>
      <th>URL</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Index</td>
      <td>GET</td>
      <td>https://www.uceem.com/users</td>
    </tr>
    <tr>
      <td>Create</td>
      <td>POST</td>
      <td>https://www.uceem.com/users</td>
    </tr>
    <tr>
      <td>Update</td>
      <td>PUT</td>
      <td>https://www.uceem.com/users/:id</td>
    </tr>
    <tr>
      <td>Show</td>
      <td>GET</td>
      <td>https://www.uceem.com/users/:id</td>
    </tr>
    <tr>
      <td>Delete</td>
      <td>DELETE</td>
      <td>https://www.uceem.com/users/:id</td>
    </tr>
  </tbody>
</table>

The primary resources available: [Accounts](/accounts/), [Users](/users/), [Routers](/routers/), [Clients](/clients/), and [Activities](/activities/).