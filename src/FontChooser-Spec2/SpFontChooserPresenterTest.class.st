Class {
	#name : #SpFontChooserPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #running }
SpFontChooserPresenterTest >> setUp [

	presenter := SpFontChooserPresenter on: FontChooser newWithDefaultFamilies.
	
]

{ #category : #tests }
SpFontChooserPresenterTest >> testFamilyListCorrectAtInitialization [

	self deny: presenter fontFamilyList items isEmpty.
	self assert: presenter fontFamilyList items size equals: 3.
	self assert: presenter fontFamilyList selectedItems equals: #().
]

{ #category : #tests }
SpFontChooserPresenterTest >> testPresenterOpenAndClose [
	
	self shouldnt: [ 
			| window | 
			window := presenter openWithSpec.
			window close ] raise: Error
]
