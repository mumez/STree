writing
appendInDirectoryName: directoryNameOrPath fileName: fileName extension: ext visit: visitBlock
	| directory |
	directory := self directoryForDirectoryNamed: directoryNameOrPath.   
	self fileUtils
        appendStreamFor: fileName , ext
        in: directory
        do: [ :fileStream | 
		fileStream lineEndConvention: #lf. "Sentences with non-ascii characters ignore this setting. Pharo's bug"
		self setFileStream: fileStream.
		visitBlock value ]