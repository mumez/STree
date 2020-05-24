utilities
addClassAndMethodDefinitionsFromDirectoryEntries: entries
    | timestamp |
    self noMethodMetaData
        ifTrue: [ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
    entries
        do: [ :element | 
            element isDirectory
                ifTrue: [ 
                    | directory |
                    directory := self fileUtils directoryFromEntry: element.
                    ((self separateMethodMetaAndSource or: [ self noMethodMetaData ])
                        ifTrue: [ directory entries select: [ :entry | entry name endsWith: '.st' ] ]
                        ifFalse: [ directory entries ])
                        do: [ :file | 
                            |  defs |
                            (defs := self definitionsFromFile: file inDirectory: directory)
                                ifNotEmpty: [ defs do: [ :each |
                                    each isMethodDefinition
                                        ifTrue: [ 
                                            self separateMethodMetaAndSource
                                                ifTrue: [ 
                                                    directory
                                                        fileNamed: each selector asString , '.meta'
                                                        do: [ :fileStream | each setTimeStamp: (Author fixStamp: fileStream contents) ] ].
                                            self noMethodMetaData
                                                ifTrue: [ each setTimeStamp: timestamp ] ].
                                    definitions add: each ] ] ] ] ]