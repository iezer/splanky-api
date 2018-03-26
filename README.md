# Cats

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * `psql -d postgres;`
  * `CREATE ROLE postgres LOGIN CREATEDB;`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Create and migrate your test database with `MIX_ENV=test mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * `mix test`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

# Heroku

Need to set pool size
`heroku run "POOL_SIZE=2 iex -S mix" -a jazz-cats-api`

# Adding Data

 * See `/lib/event_inserter`
 * `iex -S mix`
 * `EventInserter.insert_events("https://www.smallslive.com/events/calendar/2017/12/")`

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
