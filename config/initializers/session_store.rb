# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_haderach_session',
  :secret      => 'f9ba07a195e7113d34f070df6c4965aff74a7e3911b49fb1c192eda72d833cfa958a01cee82d2b1ca517a95bf8084b3dae04735f399e0106f531dd817b06a543'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
