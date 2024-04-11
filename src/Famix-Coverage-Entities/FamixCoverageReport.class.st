"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `groups` | `FamixCoverageTWithGroups` | `container` | `FamixCoverageGroup` | |
| `packages` | `FamixCoverageTWithPackages` | `container` | `FamixCoveragePackage` | |
| `sessions` | `FamixCoverageReport` | `reports` | `FamixCoverageSession` | Sessions that contribute coverage data.|


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
	#name : #FamixCoverageReport,
	#superclass : #FamixCoverageEntity,
	#traits : 'FamixCoverageTWithCoverage + FamixCoverageTWithGroups + FamixCoverageTWithPackages + FamixTNamedEntity',
	#classTraits : 'FamixCoverageTWithCoverage classTrait + FamixCoverageTWithGroups classTrait + FamixCoverageTWithPackages classTrait + FamixTNamedEntity classTrait',
	#instVars : [
		'#sessions => FMMany type: #FamixCoverageSession opposite: #reports'
	],
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageReport class >> annotation [

	<FMClass: #Report super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixCoverageReport >> addSession: anObject [
	<generated>
	^ self sessions add: anObject
]

{ #category : #accessing }
FamixCoverageReport >> sessions [
	"Relation named: #sessions type: #FamixCoverageSession opposite: #reports"

	<generated>
	<FMComment: 'Sessions that contribute coverage data.'>
	<derived>
	^ sessions
]

{ #category : #accessing }
FamixCoverageReport >> sessions: anObject [

	<generated>
	sessions value: anObject
]
