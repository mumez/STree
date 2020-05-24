utilities
definitionsFromFile: directoryEntry inDirectory: aDirectory
	| defs reader |
    directoryEntry ifNil: [ ^ nil ].
    self fileUtils
        readStreamFor: directoryEntry name
        in: aDirectory
        do: [ :fileStream | 
            reader := MCStReader on: fileStream.
            defs := reader definitions].
    ^ defs