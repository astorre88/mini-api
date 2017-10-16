use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mini, Mini.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mini, Mini.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ee",
  password: "ee",
  database: "mini_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :mini, Mini.Mailer,
  adapter: Bamboo.TestAdapter

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
