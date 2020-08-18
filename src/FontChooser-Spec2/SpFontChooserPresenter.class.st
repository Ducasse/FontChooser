"
```
(SpFontChooserPresenter on: NewFontChooser new) openWithSpec
```

For example to work on a subset of fonts, provide a specific font chooser qs follows:

```
(SpFontChooserPresenter on: NewFontChooser newWithDefaultFamilies) openWithSpec
```
"
Class {
	#name : #SpFontChooserPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'fontFamilyList',
		'fontStyleList',
		'fontSizeList',
		'currentFontStyleIndex'
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
						currentFontStyleIndex := (fontStyleList selection selectedIndex) max: 1.
						fontStyleList items: family members asSortedCollection.
						fontStyleList selectIndex: currentFontStyleIndex.
						] 
				ifNil: [   ] ]
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
SpFontChooserPresenter >> initialize [

	super initialize.   
	currentFontStyleIndex := 1.
	
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
	"fontStyleList whenSelectionChangedDo: [ :each | self halt. currentFontStyleIndex := each selectedIndex  ]."
			
	fontSizeList := self newList.
	fontSizeList display: [ :familyMember2 |  
			| size |
			size := familyMember2 size.
			familyMember2 simulated
				ifTrue: ['(', size, ')']
				ifFalse: [size] ]

]

{ #category : #initialization }
SpFontChooserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter initialExtent: 900 @ 530.
	aWindowPresenter title: self title
]

{ #category : #initialization }
SpFontChooserPresenter >> modelChanged [  
	
	fontFamilyList items: self model fontList.
	fontFamilyList selectIndex: 1.
	

]

{ #category : #initialization }
SpFontChooserPresenter >> title [ 

	^ 'Font Chooser'
]
