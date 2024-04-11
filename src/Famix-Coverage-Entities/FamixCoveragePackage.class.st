"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FamixCoveragePackage` | `packages` | `FamixCoverageTWithPackages` | |
| `coveredPackage` | `FamixCoveragePackage` | `coverages` | `FamixTPackage` | |
| `packages` | `FamixCoverageTWithPackages` | `container` | `FamixCoveragePackage` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `branchCoverage` | `Number` | nil | |
| `classCoverage` | `Number` | nil | |
| `complexity` | `Number` | nil | |
| `instructionCoverage` | `Number` | nil | |
| `lineCoverage` | `Number` | nil | |
| `methodCoverage` | `Number` | nil | |

"
Class {
	#name : #FamixCoveragePackage,
	#superclass : #FamixCoverageEntity,
	#traits : 'FamixCoverageTWithCoverage + FamixCoverageTWithPackages',
	#classTraits : 'FamixCoverageTWithCoverage classTrait + FamixCoverageTWithPackages classTrait',
	#instVars : [
		'#container => FMOne type: #FamixCoverageTWithPackages opposite: #packages'
	],
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoveragePackage class >> annotation [

	<FMClass: #Package super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixCoveragePackage >> container [
	"Relation named: #container type: #FamixCoverageTWithPackages opposite: #packages"

	<generated>
	^ container
]

{ #category : #accessing }
FamixCoveragePackage >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #accessing }
FamixCoveragePackage >> coveredPackage [
	"Relation named: #coveredPackage type: #FamixTPackage opposite: #coverages"

	<generated>
	<FMProperty: #coveredPackage type: #FamixTPackage opposite: #coverages>
	^ self attributeAt: #coveredPackage ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixCoveragePackage >> coveredPackage: anObject [

	<generated>
	self attributeAt: #coveredPackage put: (FMMultivalueLink on: self update: #coverages from: self coveredPackage to: anObject).
]
