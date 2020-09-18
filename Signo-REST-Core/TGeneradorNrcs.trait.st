Trait {
	#name : #TGeneradorNrcs,
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> caracterDeControl [

	"Caracter de control. Posición 13"
	^ ''
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> caracterDeControlComplementario [

	"Caracter de control complementario. Posición 14"
	^ '#'
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> digitoDeControl [

	"Dígito de control. Posición 13"
	^ '$'
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> digitoDeControl: numeroJustificante [

	"Dígito de control. Posición 13"
	| justificante12 |
	justificante12 := (self numeroJustificante copyFrom: 1 to: 12) asInteger.
	^ (7 - (justificante12 % 7)) asString
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> numeroSecuencial: longitud [

	| ahora diaJuliano ejercicio|
	ahora := DateAndTime now.
	diaJuliano := ahora julianDayNumber.
	ejercicio := ahora year % 1000.
	^ (diaJuliano asString , ejercicio asString) padRightTo: longitud with: $0
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> obtenerComplemento [

	^ 'ABCDEFG'
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> obtenerNrc [

	^ self obtenerNumeroReferenciaCompleto
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> obtenerNumeroReferencia [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> obtenerNumeroReferenciaCompleto [
	^ self obtenerNumeroReferencia, self obtenerComplemento 
]
