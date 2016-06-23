# squaredex

This is going to be a quick and dirty outline of the endpoints that have been created for consumption by the front-end. Emphasis on quick and dirty, at least for now.

### Auth

To initiate Authentication via slack, create a link/button that opens https://squaredex-api.herokuapp.com/api/auth/slack

Once the user is done giving permission, it would redirect to https://squaredex.herokuapp.com/auth-return with the user's token/credentials. Angular can take it from there. You'll need the token to authenticate subseqent requests.

You can call `GET https://squaredex-api.herokuapp.com/api/auth/validate_token` to validate token
You can call `PATCH https://squaredex-api.herokuapp.com/auth` to edit the sign in users' details. Params are: `name`, `nickname`, `github_username`. I think, for now, users should only be able to change `github_username`.

### Users

`GET https://squaredex-api.herokuapp.com/api/leaderboard` gets the top 20 devs/users (sorted by karma) devs on square.

`GET https://squaredex-api.herokuapp.com/api/user` responds with the current user's details.
`POST https://squaredex-api.herokuapp.com/api/karma_request` to create a Karma request. Params are: `reason`, `to` (UID of user the request is for), `project_id`. 

`PATCH https://squaredex-api.herokuapp.com/api/karma_request` to update a Karma request (before it's approved or rejected). Params are: `reason`, `to` (UID of user the request is for), `project_id`. 

