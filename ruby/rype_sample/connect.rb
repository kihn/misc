require "bundler/setup"
require 'dbus'
require 'rype'
bus = DBus::SessionBus.instance
skype_service = bus.service("com.Skype.API")
client_to_skype = skype_service.object('/com/Skype')
client_to_skype.introspect
api = client_to_skype["com.Skype.API"]
api.Invoke("NAME rype")

Rype.attach
