"
I represent the second and third list of 

```
SpSingleFontPresenter on: LogicalFontManager new defaultFamilies first.
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
		'currentFontStyleValue'
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

{ #category : #accesing }
SpSingleFontPresenter >> fontStyleList [
	^ fontStyleList
]

{ #category : #initialization }
SpSingleFontPresenter >> initializePresenters [ 
	

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
SpSingleFontPresenter >> modelChanged [  
	
	fontStyleList items: self model members asSortedCollection.
	fontStyleList selectIndex: 1.
	
]
