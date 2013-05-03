#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Classes
	# MainPage
	# SaveAddress
	
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from google.appengine.ext.webapp import template

from google.appengine.api import users

import models

# Loads the HTML of the webapp
class MainHandler(webapp.RequestHandler):
	def get(self):
	
		html = template.render('templates/header.html', {'title': 'Pumpi Alert System'})
		html = html + template.render('templates/footer.html', {})
		
		self.response.out.write(html)


class SaveAddress(webapp.RequestHandler):
	def get(self):
		#1. Parse the request
		address = self.request.get('Address')
		addressType = self.request.get('Type')
		
		#2. Use your email address to get the UserPrefs entity
		# Your address is used as the key name. If the entity doesn't
		# exist, it is created.
		user = users.get_current_user()
		#UserPrefs = models.UserPrefs.get_or_insert(str(user.email()))
		UserPrefs = models.UserPrefs.get_or_insert('linder.pascal@gmail.com')
		
		#3. Based on the addressType, set the UserPrefs property
		if addressType == 'email':
			UserPrefs.emailAddress = address
		else:
			UserPrefs.textAddress = address
			
		#4. Put the entity in the datastore
		UserPrefs.put()
		
		#5. Return a response
		html = template.render('templates/saved.html', {'title': 'Pumpi Alert System - config saved!'})
		html = html + "Saved !!!"
		html = html + template.render('templates/footer.html', {})
		#self.response.out.write('Saved')
		self.response.out.write(html)
		
app = webapp.WSGIApplication([('/', MainHandler), ('/SaveAddress', SaveAddress)], debug=True)