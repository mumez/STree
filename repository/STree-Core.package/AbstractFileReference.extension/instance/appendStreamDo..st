*STree-Core-Core-streams
appendStreamDo: aBlock
	| stream |
	stream := self writeStream.
	stream setToEnd.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]