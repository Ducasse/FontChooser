"
```
FontChooserPresenter new openWithSpec
```
"
Class {
	#name : #SpFontChooserPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'fontFamilyList'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
SpFontChooserPresenter class >> defaultSpec [ 

	^ SpBoxLayout newVertical
		add: #fontFamilyList;
		yourself
			
]

{ #category : #accessing }
SpFontChooserPresenter >> fontFamilyList [ 
	
	^ fontFamilyList 

]

{ #category : #initialization }
SpFontChooserPresenter >> initializePresenters [ 
	
	fontFamilyList := self newList.
	

]

{ #category : #initialization }
SpFontChooserPresenter >> modelChanged [  

	fontFamilyList items: self model fontList.

]
