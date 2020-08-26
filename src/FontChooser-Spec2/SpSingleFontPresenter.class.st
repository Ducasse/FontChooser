"
I represent the second and third list of 

```
(SpSingleFontPresenter on: LogicalFontManager new defaultFamilies first) openWithSpec
```


```
FontChooser
 openWithWindowTitle: 'Choose the Menu Font'
 for: StandardFonts
 setSelector: #menuFont:
 getSelector: #menuFont
```
"
Class {
	#name : #SpSingleFontPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'fontStyleList',
		'fontSizeList',
		'currentFontSizeValue',
		'fontSizeIndex'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
SpSingleFontPresenter class >> defaultSpec [ 

	^  SpBoxLayout newHorizontal 
			add: #fontStyleList;
			add: #fontSizeList;
			yourself
]

{ #category : #specs }
SpSingleFontPresenter class >> example [
	<sampleInstance>
	^ SpSingleFontPresenter on: LogicalFontManager new defaultFamilies first.
]

{ #category : #initialization }
SpSingleFontPresenter >> connectPresenters [
	
	fontStyleList 
		whenSelectionChangedDo: [ :selection | 
			selection selectedItem
				ifNotNil: [ :member | 
					
						"self storeCurrentFontSizeValue."
						" we set number but this is not good becquse the model is strqnge and somehow defined in the font chooser."
						fontSizeList items: (member family pointSizeListFrom).
						"self refreshFontSizeList"  ]
						]
]

{ #category : #'font style list' }
SpSingleFontPresenter >> firstFontSizeValue [ 
	"when there is no element that correspond to the previous selection, return the default value"
	
	^ 12
]

{ #category : #accessing }
SpSingleFontPresenter >> fontSizeList [ 
	
	^ fontSizeList

]

{ #category : #accessing }
SpSingleFontPresenter >> fontStyleList [

	^ fontStyleList
]

{ #category : #initialization }
SpSingleFontPresenter >> initializePresenters [ 
	
	"members of a family"
	fontStyleList := self newList.
	fontStyleList display: [ :fontStyle |  
			| styleName |
			styleName := fontStyle styleName.
			fontStyle simulated
				ifTrue: ['(', styleName, ')']
				ifFalse: [styleName] ].
			
			
	fontSizeList := self newList.
	"fontSizeList display: [ :familyMember2 |  
		
			| size |
			size := familyMember2 size.
			familyMember2 simulated
				ifTrue: ['(', size, ')']
				ifFalse: [size] ]"

]

{ #category : #design }
SpSingleFontPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter initialExtent: 400 @ 330.
	aWindowPresenter title: self title
]

{ #category : #initialization }
SpSingleFontPresenter >> modelChanged [  

	fontStyleList items: self model members asSortedCollection.
	fontStyleList selectIndex: 1.
	
]

{ #category : #'font style list' }
SpSingleFontPresenter >> storeCurrentFontSizeValue [ 

	currentFontSizeValue := fontSizeList selection isEmpty
		ifTrue: [ self firstFontSizeValue ]
		ifFalse: [  fontSizeList displayValueFor: (fontSizeList selection selectedItem)].
]
