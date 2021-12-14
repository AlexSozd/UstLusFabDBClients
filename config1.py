import sys,os
config = {}

#	Get connection object
def GetConfig():
	return config

#	Create connection string for defined user\password
def MakeCS(user,password):
	config_copy = GetConfig()
	res = user + '/' + password + '@' + config_copy['SQLhostL'] + '/' + config_copy['SQLinstance']
	return res

