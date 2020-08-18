"
```
(SpFontChooserPresenter on: FontChooser new) openWithSpec
```

For example to work on a subset of fonts, provide a specific font chooser qs follows:

```
(SpFontChooserPresenter on: FontChooser newWithDefaultFamilies) openWithSpec
```
"
Class {
	#name : #SpFontChooserPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'fontFamilyList',
		'fontStyleList',
		'fontSizeList'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
SpFontChooserPresenter class >> defaultSpec [ 

	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal 
					add: #fontFamilyList;
					add: #fontStyleList;
					yourself);
					
		yourself
			
]

{ #category : #initialization }
SpFontChooserPresenter >> connectPresenters [ 
	
	fontFamilyList 
		whenSelectionChangedDo: [ :selection | 
			selection selectedItem
				ifNotNil: [ :family | 
						fontStyleList items: family members asSortedCollection.
						fontStyleList selectIndex: 1.
						"in the future we will have to use the previously selected element."
						] 
				ifNil: [ "Avoid the user to have no page selected at all."  ] ]
]

{ #category : #accessing }
SpFontChooserPresenter >> fontFamilyList [ 
	
	^ fontFamilyList 

]

{ #category : #accessing }
SpFontChooserPresenter >> fontSizeList [ 
	
	^ fontSizeList 

]

{ #category : #accessing }
SpFontChooserPresenter >> fontStyleList [
	^ fontStyleList
]

{ #category : #initialization }
SpFontChooserPresenter >> initializePresenters [ 
	
	fontFamilyList := self newList.
	fontFamilyList display: [ :each | each familyName ].
	
	fontStyleList := self newList.
	fontStyleList display: [ :familyMember |  
			| styleName |
			styleName := familyMember styleName.
			familyMember simulated
				ifTrue: ['(', styleName, ')']
				ifFalse: [styleName] ].
			
	fontSizeList := self newList.
	fontSizeList display: [ :familyMember2 |  
			| size |
			size := familyMember2 size.
			familyMember2 simulated
				ifTrue: ['(', size, ')']
				ifFalse: [size] ]

]

{ #category : #initialization }
SpFontChooserPresenter >> modelChanged [  

	fontFamilyList items: self model fontList.
	fontFamilyList selectIndex: 1.
	
]
