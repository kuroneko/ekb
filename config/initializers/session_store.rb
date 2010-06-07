# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ekb_session',
  :secret      => 'e89efe07927b5a1dc0634fc33d2b407684a21ddaa3b66d017bf62553450df372db90e0f7e7e26beef53f0367d571feb22182fd473ab5a5abe967df3bfda7a21b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
