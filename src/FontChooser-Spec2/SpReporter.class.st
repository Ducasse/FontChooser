"
SpReporter new openWithSpec
"
Class {
	#name : #SpReporter,
	#superclass : #SpPresenter,
	#instVars : [
		'topicList',
		'reportText',
		'categoriesSelected',
		'categories',
		'sourceTextModel',
		'categoryList'
	],
	#classInstVars : [
		'reportText'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
SpReporter class >> defaultSpec [
	"self new openWithSpec"
	^ (SpBoxLayout newHorizontal 
			add: #topicList withConstraints: [ :constraints | constraints width: 140 ];
			add: #reportText;
			yourself)
]

{ #category : #accessing }
SpReporter >> categoryList [
	^ categoryList ifNil: [ categoryList := OrderedCollection new ]
]

{ #category : #initialization }
SpReporter >> connectPresenters [  

	topicList whenSelectionChangedDo: [ :selection | 
			selection selectedItems
				ifNotNil: [ :items |
								reportText text: (self createTextForReport: items)]]
]

{ #category : #'building report' }
SpReporter >> createTextForReport [

	^ (Text streamContents: [:stream | 
						topicList items do: [:each |
								self perform: each value with: stream.
								stream cr]])
]

{ #category : #'building report' }
SpReporter >> createTextForReport: items [

	^ (Text streamContents: [:stream | 
						items do: [:each |
								self perform: each value with: stream.
								stream cr]])
]

{ #category : #utils }
SpReporter >> enumerate: aBlock on: aStream [
	self enumerate: aBlock startAt: 0 on: aStream
]

{ #category : #utils }
SpReporter >> enumerate: aBlock startAt: first on: aStream [
	"Utility method to enumerate Options or Parameters from first to 1000"

	| idx value |
	idx := first.
	[ 
	value := aBlock value: idx.
	value isNil or: [ idx > 1000 ] ]
		whileFalse: [ 
			aStream
				nextPut: $#;
				nextPutAll: idx printString;
				tab;
				nextPutAll: value;
				cr.
			idx := idx + 1 ].
	idx = first
		ifTrue: [ 
			aStream
				nextPutAll: 'none';
				cr ]
]

{ #category : #utils }
SpReporter >> header: aString on: aStream [
	aStream
		withAttribute: TextEmphasis bold
		do: [ aStream
				nextPutAll: aString;
				cr.
			aString size timesRepeat: [ aStream nextPut: $- ].
			aStream cr ]
]

{ #category : #initialization }
SpReporter >> initializePresenters [ 

	topicList := self newList.
	topicList beMultipleSelection.
	topicList display: [ :each | each key ].
	self fillTopics.
	reportText := self newText.
]

{ #category : #initialization }
SpReporter >> initializeWindow: aPres [

	aPres title: self title
]

{ #category : #accessing }
SpReporter >> sourceTextModel [
	^ sourceTextModel
		ifNil: [ sourceTextModel := RubScrolledTextModel new interactionModel: self ]
]

{ #category : #updating }
SpReporter >> updateReport [
	self sourceTextModel setText: (Text streamContents: [:stream | 
						self categoryList do: [:each |
							(categoriesSelected includes: each) ifTrue: [
								self perform: (categories at: each) with: stream.
								stream cr]]])

]
