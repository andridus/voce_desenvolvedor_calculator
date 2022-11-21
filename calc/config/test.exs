import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :calc, CalcWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VmarAbfEOsWRXLPCrJOEBIIlocEVAArQcYI6QXuHZZ4PELfPf8eROxe8OnO21Nbc",
  server: false

# In test we don't send emails.
config :calc, Calc.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
