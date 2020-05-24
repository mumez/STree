*STree-Core-Core-utilities
appendStreamFor: filePath in: aDirectory do: aBlock
    (aDirectory resolveString: filePath) appendStreamDo: aBlock