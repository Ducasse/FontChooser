"
SpSystemReporter new openWithSpec
"
Class {
	#name : #SpSystemReporter,
	#superclass : #SpPresenter,
	#instVars : [
		'topicList',
		'reportText'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
SpSystemReporter class >> defaultSpec [
	"self new openWithSpec"
	^ (SpBoxLayout newHorizontal 
			add: #topicList;
			add: #reportText;
			yourself)
]

{ #category : #initialization }
SpSystemReporter >> connectPresenters [  

	topicList whenSelectionChangedDo: [ :selection | 
			selection selectedItems
				ifNotNil: [ :items |
								reportText acceptText: (self createTextForReport: items)]]
]

{ #category : #'building report' }
SpSystemReporter >> createTextForReport [

	^ (Text streamContents: [:stream | 
						topicList items do: [:each |
								self perform: each value with: stream.
								stream cr]])
]

{ #category : #'building report' }
SpSystemReporter >> createTextForReport: items [

	^ (Text streamContents: [:stream | 
						items do: [:each |
								self perform: each value with: stream.
								stream cr]])
]

{ #category : #utils }
SpSystemReporter >> enumerate: aBlock on: aStream [
	self enumerate: aBlock startAt: 0 on: aStream
]

{ #category : #utils }
SpSystemReporter >> enumerate: aBlock startAt: first on: aStream [
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

{ #category : #initialization }
SpSystemReporter >> fillTopics [

	topicList items: 
		 {(#Image -> #reportImage:) .
		  (#'Image Parameters' -> #reportImageParameters:)}
]

{ #category : #utils }
SpSystemReporter >> header: aString on: aStream [
	aStream
		withAttribute: TextEmphasis bold
		do: [ aStream
				nextPutAll: aString;
				cr.
			aString size timesRepeat: [ aStream nextPut: $- ].
			aStream cr ]
]

{ #category : #initialization }
SpSystemReporter >> initializePresenters [ 

	topicList := self newList.
	topicList beMultipleSelection.
	topicList display: [ :each | each key ].
	self fillTopics.
	reportText := self newText.
]

{ #category : #initialization }
SpSystemReporter >> initializeWindow: aPres [

	aPres title: 'System Reporter'
]

{ #category : #'building report' }
SpSystemReporter >> reportImage: aStream [
	self header: 'Image' on: aStream.
	aStream 
		nextPutAll: Smalltalk image imagePath; cr;
		nextPutAll: SystemVersion current version; cr;
		nextPutAll: Smalltalk image lastUpdateString; cr;
		nextPutAll: ChangeSet current name; cr

]

{ #category : #'building report' }
SpSystemReporter >> reportImageParameters: aStream [
	self header: 'Image Commandline Parameters' on: aStream.
	self enumerate: [:idx | Smalltalk image argumentAt: idx] on: aStream
]
