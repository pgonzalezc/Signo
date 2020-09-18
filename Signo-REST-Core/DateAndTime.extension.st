Extension { #name : #DateAndTime }

{ #category : #'*Signo-REST-Core' }
DateAndTime >> asLocalStringYMDHMS [

	^ String streamContents: [ :aStream |
		self printYMDOn: aStream.
		aStream nextPut: Character space.
		self hour printOn: aStream base: 10 length: 2 padded: true.
		aStream nextPut: $:.
		self minute printOn: aStream base: 10 length: 2 padded: true.
		aStream nextPut: $:.
		self second printOn: aStream base: 10 length: 2 padded: true ].
]
