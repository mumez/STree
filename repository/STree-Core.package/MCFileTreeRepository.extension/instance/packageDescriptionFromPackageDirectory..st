*STree-Core-Core-actions-override
packageDescriptionFromPackageDirectory: packageDirectory
    | filename info extension |
    filename := self fileUtils current directoryName: packageDirectory.
    extension := filename copyFrom: (filename lastIndexOf: $.) to: filename size.
    ^ ((self packageExtension ~= '.package'
        and: [ 
            (self fileUtils filePathExists: 'version' relativeTo: packageDirectory)
                and: [ self fileUtils filePathExists: 'package' relativeTo: packageDirectory ] ])
        or: [ 
            | dir |
            dir := self fileUtils
                directoryFromPath: MCFileTreeStCypressWriter monticelloMetaDirName
                relativeTo: packageDirectory.
            self fileUtils directoryExists: dir ])
        ifTrue: [ 
            info := self versionInfoForPackageDirectory: packageDirectory.
            self parseName: info name extension: extension ]
        ifFalse: [ | packageName ancestors verNum |
            packageName := (filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1).
            ancestors := (MCWorkingCopy forPackage: (MCPackage named: packageName)) ancestors.
            verNum := ancestors ifEmpty: [1] ifNotEmpty: [ancestors last versionNumber]. 
            {packageName.
            Author fullName.
            verNum.
            filename} ]