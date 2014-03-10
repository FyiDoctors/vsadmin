# Be sure to restart your server when you modify this file.

Vsmembership::Application.config.session_store :cookie_store, key: '_vsmembership_session'

Vsmembership::Application.config.session_store :cookie_store, 
   :key => '_my_session', 
   :expire_after => 1.month