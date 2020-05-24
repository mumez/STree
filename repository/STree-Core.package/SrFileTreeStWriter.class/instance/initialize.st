initialization
initialize
	super initialize.
	SystemVersion current major >= 5 ifTrue: [ stWriter writeInitializers: false ]