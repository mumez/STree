*STree-Core-Core-accessing-override
defaultPackageExtension: aString
    ".tree and .pkg are the only two formats supported at the moment"

    "self defaultPackageExtension:'.package'"

    (#('.tree' '.pkg' '.package' '.stree') includes: aString)
        ifFalse: [ self error: 'Unsupported package extension: ' , aString printString ].
    defaultPackageExtension := aString