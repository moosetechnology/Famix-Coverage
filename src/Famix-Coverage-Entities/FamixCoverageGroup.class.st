"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FamixCoverageGroup` | `groups` | `FamixCoverageTWithGroups` | |
| `groups` | `FamixCoverageTWithGroups` | `container` | `FamixCoverageGroup` | |


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
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixCoverageGroup,
	#superclass : #FamixCoverageEntity,
	#traits : 'FamixCoverageTWithCoverage + FamixCoverageTWithGroups + FamixTNamedEntity',
	#classTraits : 'FamixCoverageTWithCoverage classTrait + FamixCoverageTWithGroups classTrait + FamixTNamedEntity classTrait',
	#instVars : [
		'#container => FMOne type: #FamixCoverageTWithGroups opposite: #groups'
	],
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageGroup class >> annotation [

	<FMClass: #Group super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixCoverageGroup >> container [
	"Relation named: #container type: #FamixCoverageTWithGroups opposite: #groups"

	<generated>
	^ container
]

{ #category : #accessing }
FamixCoverageGroup >> container: anObject [

	<generated>
	container := anObject
]
