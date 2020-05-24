visiting
visitMethodDefinition: definition
	self methodDefinitions add: definition .
	
	definition isInitializer ifTrue: [ 
		initializers add: (definition className -> (definition className, ' initialize!', String cr)) ]