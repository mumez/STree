*STree-Core-Core-writing-override
on: aStream
	MCFileTreePackageStructureStWriter useCypressWriter
		ifTrue: [ ^ MCFileTreeStCypressWriter new stream: aStream ].
	MCFileTreePackageStructureStWriter useSnapShotWriter
		ifTrue: [ ^ MCFileTreeStSnapshotWriter new stream: aStream ].
	MCFileTreePackageStructureStWriter useSTreeWriter
		ifTrue: [ ^ SrFileTreeStWriter new stream: aStream ].
	^ MCFileTreeStWriter new stream: aStream