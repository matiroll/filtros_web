# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_filtros_web_session',
  :secret      => '7ecb752d38abcefa50fa7b3cd9b6015c95e81de70ac1bf1c3b458cfd8fa8e640ec1896e3b6bb8bad5395bc34e33104a66354977566d16b8538f43c3d358c6e85'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
