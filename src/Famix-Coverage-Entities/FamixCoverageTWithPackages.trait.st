"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `packages` | `FamixCoverageTWithPackages` | `container` | `FamixCoveragePackage` | |



"
Trait {
	#name : #FamixCoverageTWithPackages,
	#instVars : [
		'#packages => FMMany type: #FamixCoveragePackage opposite: #container'
	],
	#category : #'Famix-Coverage-Entities-Traits'
}

{ #category : #meta }
FamixCoverageTWithPackages classSide >> annotation [

	<FMClass: #TWithPackages super: #Object>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixCoverageTWithPackages >> addPackage: anObject [
	<generated>
	^ self packages add: anObject
]

{ #category : #accessing }
FamixCoverageTWithPackages >> packages [
	"Relation named: #packages type: #FamixCoveragePackage opposite: #container"

	<generated>
	<derived>
	^ packages
]

{ #category : #accessing }
FamixCoverageTWithPackages >> packages: anObject [

	<generated>
	packages value: anObject
]
