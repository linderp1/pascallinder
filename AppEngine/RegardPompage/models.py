# classes
	# UsersPrefs
	
from google.appengine.api import users
from google.appengine.ext import db

class UserPrefs(db.Model):
	tz_offset		= db.IntegerProperty(default=0)
	emailAddress	= db.StringProperty()
	textAddress		= db.StringProperty()