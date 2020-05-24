initialization
writeDefinitions: aCollection
	self writeBasicDefinitions: aCollection.
	self classDefinitions
		do: [ :each | 
			self
				writeInDirectoryName: each className
				fileName: each className
				extension: '.st'
				visit: [ self writeClassDefinition: each ] ].
	(self methodDefinitions sorted: [ :a :b | a description asString < b description asString ])
		do: [ :each | 
			self
				appendInDirectoryName: each className
				fileName: each className
				extension: '.st'
				visit: [ self writeMethodDefinition: each ] ].
	self trimMetaFiles