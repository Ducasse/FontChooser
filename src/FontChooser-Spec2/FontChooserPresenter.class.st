"
```
FontChooserPresenter new openWithSpec
```
"
Class {
	#name : #FontChooserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fontFamilyList'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
FontChooserPresenter class >> defaultSpec [ 

	^ SpBoxLayout newVertical
		add: #fontFamilyList;
		yourself
			
]

{ #category : #initialization }
FontChooserPresenter >> initializePresenters [ 

	fontFamilyList := self newList.
	fontFamilyList items: #( 1 2  3)
]
