Class {
	#name : #NRCService,
	#superclass : #WARestfulHandler,
	#category : #'Signo-REST-Core'
}

{ #category : #'class initialization' }
NRCService class >> initialize [ 
	
	WAAdmin register: self at: 'signo'
]

{ #category : #'as yet unclassified' }
NRCService >> checkEntidad: unaEntidad [

	unaEntidad size ~= 4
		ifTrue: [ (NRCErrores e102ParametroEntidadLongitudIncorrecta conTextosAdicionales: { unaEntidad}) signal ]
]

{ #category : #'as yet unclassified' }
NRCService >> checkNrc: unNrc [

	unNrc ifNil: [ NRCErrores e101ParametroNrcNoInformado signal ].
	unNrc size ~= 22 
		ifTrue: [ (NRCErrores e100ParametroNrcLongitudIncorrecta conTextosAdicionales: { unNrc }) signal ]
	
]

{ #category : #'as yet unclassified' }
NRCService >> consolidarNrc: unNrc [

| requestData responseData |
	<post>
	<path: '{unNrc}'>
	<produces: 'application/json'>
	
	[self checkNrc: unNrc]
		on: NRCExcepcion
		do: [ :ex | self requestContext respond: [ :response | response
				contentType: 'text/plain'; 
				status: 417;
				nextPutAll: ex asString ]].
	requestData := Dictionary 
		with: '/nrc' -> unNrc.
	responseData := Dictionary 
		with: 'status' -> 0
		with: 'descripcion' -> ''.
	^ (Dictionary newFromKeys: #(input output) andValues: { requestData . responseData} ) asJson.
]

{ #category : #'as yet unclassified' }
NRCService >> generarNrc: tipo [
	<put>
	<path: '/{tipo}'>
	<produces: 'application/json'>
	| requestData responseData generador |
	requestData := (NeoJSONReader
		on: self requestContext request rawBody readStream)
		propertyNamesAsSymbols: true;
		next.
	[ generador := (self class environment
		at: ('NRC' , tipo capitalized) asSymbol) instanceWith: requestData ]
		on: KeyNotFound
		do: [ :ex | 
			self requestContext
				respond: [ :response | 
					response
						contentType: 'text/plain';
						status: 417;
						nextPutAll:
							(NRCErrores e103TipoServicioNoDisponible conTextosAdicionales: {tipo})
								asString ] ].
	requestData at: '/tipoServicio' put: tipo.
	responseData := self
		responseWithNrc: generador obtenerNumeroReferenciaCompleto.
	^ (Dictionary
		newFromKeys: #('input' 'output')
		andValues:
			{requestData.
			responseData}) asJson
]

{ #category : #'as yet unclassified' }
NRCService >> responseWithError: anError [

	^ self responseWithStatus: anError codigo descripcion: anError descripcion
]

{ #category : #'as yet unclassified' }
NRCService >> responseWithNrc: unNrc [

	^ Dictionary newFromKeys: #('nrc' 'status' 'descripcion') andValues: { unNrc . 0 . '' }
]

{ #category : #'as yet unclassified' }
NRCService >> responseWithStatus: unStatus descripcion: unaCadena [ 

	^ Dictionary newFromKeys: #(nrc status descripcion) andValues: { '' . unStatus . unaCadena }
]

{ #category : #'rest-service' }
NRCService >> validarNrc: nrc from: entidad [
| context |

	<get>
	<path: '/{entidad}/{nrc}'>
	<produces: 'application/json'>
	
	context := self requestContext.
	[ self checkNrc: nrc ] 
		on: NRCExcepcion 
		do: [ :ex |  context respond: [ :response | response
				contentType: 'text/plain'; 
				status: 417;
				nextPutAll: ex asString ] ].
	[ self checkEntidad: entidad ]
		on: NRCExcepcion 
		do: [ :ex |  context respond: [ :response | response
				contentType: 'text/plain'; 
				status: 417;
				nextPutAll: ex asString ] ].
	
	^ String streamContents:  [ :stream | stream 
		nextPutAll: 'Hemos accedido a la base de datos para validar el NRC '; 
		nextPutAll: nrc; 
		nextPutAll: ' de la entidad: ';
		nextPutAll: entidad;
		crlf ]
]
