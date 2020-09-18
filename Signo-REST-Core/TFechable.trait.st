Trait {
	#name : #TFechable,
	#category : #'Signo-REST-Core'
}

{ #category : #conversion }
TFechable >> fechaAAAAMMDD [

	^  '{1}{2}{3}' format: { self fecha year . self fecha month asString padLeftTo: 2 with: $0  . self fecha dayOfMonth }
]

{ #category : #conversion }
TFechable >> fechaAAMM [

	^ '{1}{2}' format: { self fecha year % 1000 .  self fecha month asString padLeftTo: 2 with: $0 }
]

{ #category : #conversion }
TFechable >> fechaMMDD [

	^ '{1}{2}' format: { 
		self fecha month asString padLeftTo: 2 with: $0 . 
		self fecha dayOfMonth  }
]

{ #category : #classification }
TFechable >> tipoFecha [

	self subclassResponsibility
]
