Class {
	#name : #SpSingleFontPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #running }
SpSingleFontPresenterTest >> setUp [ 
	
	presenter := SpSingleFontPresenter on: LogicalFontManager new defaultFamilies first.
	
]

{ #category : #tests }
SpSingleFontPresenterTest >> testFirstSizeIsSelected [
	self skip.
	self assert: (presenter fontSizeList selectedItems collect: [:each | each size ]) equals: #('1')
]

{ #category : #tests }
SpSingleFontPresenterTest >> testPresenterOpenAndClose [
	
	self shouldnt: [ 
			| window | 
			window := presenter openWithSpec.
			window close ] raise: Error
]

{ #category : #tests }
SpSingleFontPresenterTest >> testStyleIsDisplayed [
	
	self 
		assert: presenter fontStyleList items size 
		equals: #('Regular' 'Italic' 'Bold' 'Bold Italic') size
]

{ #category : #tests }
SpSingleFontPresenterTest >> testStyleListCorrectAtInitialization [
 
	self deny: presenter fontStyleList items isEmpty.
	self assert: presenter fontStyleList items size equals: 4.
	self 
		assert: presenter fontStyleList selectedItems 
		equals: { presenter fontStyleList items first}.
	self 
		assert: (presenter fontStyleList displayValueAt: 1) 
		equals: 'Regular'
]
