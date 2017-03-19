import csv
import urllib2
import time
import requests
from datetime import datetime, timedelta

### API DOCS XIVELY - Historical Data || https://xively.com/dev/docs/api/quick_reference/historical_data/
## Experts & brave go directly to code, it's easy

"""
Example to retrieval all sensor data from a specified date to current moment.

where:
	sensor sends every minute (typically power sensor, current sensor, etc.)
	
	apikey_xively = "zVf35-3ED5gJH4F87FKlU_ghOpGSjax1ck12aoK06G7lBV60p"
	feed = 448145891
	id = "power_sensor"
	interval = 60		# each 1 minut (view API DOCS)
	duration = "30minutes"	# time limit to recovery all data by sensors that send values every minut (limitation API XIVELY)

	start_date = "2014-11-28T00:00:00Z"	# expressed according to ISO 8601
	end_datetime = datetime.now()
	deltatime = timedelta(minutes=30)	# iterator every 30 minuts

result:
	file: 
		power_sensor_2014-12-22T00:00:00Z_2014-12-22T18:29:53Z.csv
	data:
		power_sensor,2014-12-22T00:00:36.847990Z,71.64
		power_sensor,2014-12-22T00:01:36.868671Z,72.40
		power_sensor,2014-12-22T00:02:36.890888Z,73.96
		power_sensor,2014-12-22T00:03:37.018208Z,84.11
		power_sensor,2014-12-22T00:04:36.910466Z,73.07
		power_sensor,2014-12-22T00:05:36.892205Z,73.28
		...
"""

##  https://api.xively.com/v2/feeds/1464880832.csv?key=DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g
##  https://api.xively.com/v2/feeds/1464880832

## xively data
apikey_xively = "DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g"
feed = "1464880832"
id = "Level"


try: 
	## response = urllib2.urlopen('https://api.xively.com/v2/feeds/'+str(feed)+'.csv?key='+apikey_xively+'&start='+ day.strftime("%Y-%m-%dT%H:%M:%SZ")+'&interval='+str(interval)+'&duration='+duration) # get data
	response = urllib2.urlopen('https://api.xively.com/v2/feeds/'+str(feed)+'.csv?key='+apikey_xively) # get data
except:
	time.sleep(0.3)
      	raise # try again
cr = csv.reader(response) # return data in columns
print '.'
for row in cr:
	if row[0] in id: # choose desired data
		f.write(row[0]+","+row[1]+","+row[2]+"\n") # write "id,timestamp,value"

print("--- %.3f seconds ---" % (time.time() - start)) # print elapsed time