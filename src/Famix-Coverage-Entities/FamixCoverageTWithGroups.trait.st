"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `groups` | `FamixCoverageTWithGroups` | `container` | `FamixCoverageGroup` | |



"
Trait {
	#name : #FamixCoverageTWithGroups,
	#instVars : [
		'#groups => FMMany type: #FamixCoverageGroup opposite: #container'
	],
	#category : #'Famix-Coverage-Entities-Traits'
}

{ #category : #meta }
FamixCoverageTWithGroups classSide >> annotation [

	<FMClass: #TWithGroups super: #Object>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixCoverageTWithGroups >> addGroup: anObject [
	<generated>
	^ self groups add: anObject
]

{ #category : #accessing }
FamixCoverageTWithGroups >> groups [
	"Relation named: #groups type: #FamixCoverageGroup opposite: #container"

	<generated>
	<derived>
	^ groups
]

{ #category : #accessing }
FamixCoverageTWithGroups >> groups: anObject [

	<generated>
	groups value: anObject
]
