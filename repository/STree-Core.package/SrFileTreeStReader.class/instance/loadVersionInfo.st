loading
loadVersionInfo
	| authorName |
	authorName := Author fullName.
	info := MCVersionInfo
		name:  (self package name, '-', authorName, '.1')
		id: UUID new
		message: ''
		date: Date today
		time: Time now
		author: ''
		ancestors: #()
		stepChildren: #()