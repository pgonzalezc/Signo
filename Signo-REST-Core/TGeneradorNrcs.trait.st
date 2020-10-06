Trait {
	#name : #TGeneradorNrcs,
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
TGeneradorNrcs classSide >> generaCaracteresAleatorios: longitud [

	| alfabeto random resp|
	alfabeto := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'.
	resp := ''.
	random := Random new.
	longitud timesRepeat: [ resp := resp, ((alfabeto at: (random next * 32 + 1) asInteger) asString) ].
	^ resp
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> caracterDeControl: from [

	"Caracter de control. Posición 13"
	| numeroJustificante origenDigitoControl13 |
	numeroJustificante := from.
	(numeroJustificante at: 12) isLetter 
		ifTrue: [ 
			origenDigitoControl13 := numeroJustificante copyFrom: 1 to: 12.
			numeroJustificante := origenDigitoControl13, (self digitoDeControl: origenDigitoControl13)
		].
	^ 'CRSAEZKJQBFPNDWMXTY' at: (19 - (numeroJustificante asInteger % 19))
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> caracterDeControlComplementario [

	"Caracter de control complementario. Posición 14"
	^ '#'
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> caracterDeControlComplementario: from importe: unImporte [

	"Caracter de control complementario. Posición 14"
	| suma |
	suma := (from copyFrom: 1 to: 12) asInteger + ((unImporte * 100.0) round: 0).
	^ 'TRWAGMYFPDXBNJZSQVHLCKE' at: (suma % 23)

]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> digitoDeControl: numeroJustificante [

	"Dígito de control. Posición 13"
	| justificante12 dc |
	justificante12 := (self numeroJustificante copyFrom: 1 to: 12) asInteger.
	dc := 7 - (justificante12 % 7).
	^ dc = 0 ifTrue: [ 0 ] ifFalse: [ dc asString ]
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> numeroSecuencial: longitud [

	| ahora diaJuliano ejercicio|
	(longitud < 5)
		ifTrue: [ NRCErrores e110longitudNumeroSecuencia signal ].
	ahora := DateAndTime now.
	diaJuliano := ahora dayOfYear.
	ejercicio := ahora year % 1000.
	^ (ejercicio asString, diaJuliano asString) padRightTo: longitud with: $0
]

{ #category : #'as yet unclassified' }
TGeneradorNrcs >> obtenerComplemento [
	
	"genera siete caracteres aleatorios"
	^ TGeneradorNrcs generaCaracteresAleatorios: 7
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

	| preNumeroCompleto |
	preNumeroCompleto := self obtenerNumeroReferencia, self obtenerComplemento.
	^ preNumeroCompleto, ((NRCCrc crc5: preNumeroCompleto) asString )
]
