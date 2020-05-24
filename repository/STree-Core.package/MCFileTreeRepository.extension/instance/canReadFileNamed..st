*STree-Core-Core-testing-override
canReadFileNamed: aString
    ^ (aString endsWith: self packageExtension)
        or: [ #('.tree' '.package' '.stree') anySatisfy: [:each | aString endsWith: each ] ]
        