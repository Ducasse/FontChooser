"
```
FontChooserPresenter new openWithSpec
```
"
Class {
	#name : #FontChooserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fontChooser',
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
	fontChooser := FontChooser new. 
	fontFamilyList := self newList.
	fontFamilyList items: fontChooser fontList.
	fontFamilyList selectedIndex: 1
]
