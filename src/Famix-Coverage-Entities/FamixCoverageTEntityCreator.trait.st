"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FamixCoverageTEntityCreator,
	#category : #'Famix-Coverage-Entities-Model'
}

{ #category : #meta }
FamixCoverageTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newClass [

	<generated>
	^ self add: FamixCoverageClass new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newFile [

	<generated>
	^ self add: FamixCoverageFile new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newGroup [

	<generated>
	^ self add: FamixCoverageGroup new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newGroupNamed: aName [

	<generated>
	^ self add: (FamixCoverageGroup named: aName)
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newLine [

	<generated>
	^ self add: FamixCoverageLine new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixCoverageMethod new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newPackage [

	<generated>
	^ self add: FamixCoveragePackage new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newReport [

	<generated>
	^ self add: FamixCoverageReport new
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newReportNamed: aName [

	<generated>
	^ self add: (FamixCoverageReport named: aName)
]

{ #category : #'entity creation' }
FamixCoverageTEntityCreator >> newSession [

	<generated>
	^ self add: FamixCoverageSession new
]
