# Classes
	# Alert
	
# Function
	# SendAlert
	
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from google.appengine.ext.webapp import template

from google.appengine.api import mail
from google.appengine.api import users

import models

def SendAlert(alertType, criticality, value):
		# Get the UserPrefs entity using your email address as the key_name.
		# This address is hard-coded because App Engine can't tell who the
		# current user is from an Arduino request. You could pass this
		# in if you wanted to.
		UserPrefs = models.UserPrefs.get_or_insert('linder.pascal@gmail.com')
		
		# Get the address from the entity based on the type of alert wanted
		if alertType == 'email':
			address = UserPrefs.emailAddress
		else:
			address = UserPrefs.textAddress
		
		# Prepare the message
		if criticality == 'bad':
			msg = 'The water level in the pump reached a critical value! '
			msg = msg + ' Current level = ' + str(value)
		else:
			msg = 'The water level in the pump reached a normal value. '
			msg = msg + ' Current level = ' + str(value)

			
		# This sends the email.
		# A special note here - the SENDER address must be the address
		# you used to create the application, or an address you have
		# given administration privileges.
		mail.send_mail(
			sender = UserPrefs.emailAddress,
			to = address,
			subject = 'Pumpi Alert!' + ' water height: ' + value + 'cm',
			body = msg)
			
		# Message used as the response
		return('Message Sent') 

# Process the Alert Request
class Alert(webapp.RequestHandler):
	def get(self):
		# Parse the request from the Arduino to determine if you
		# want an email alert or a txt msg
		alertType = self.request.get('Type')
		alertCriticality = self.request.get('Criticality') 
		alertValue = self.request.get('Value')
		
		# Call the SendAlert function and return the response to the Arduino
		self.response.out.write(SendAlert(alertType, alertCriticality, alertValue))
		
app = webapp.WSGIApplication([('/alerts', Alert)], debug=True)