"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `reports` | `FamixCoverageSession` | `sessions` | `FamixCoverageReport` | Reports to which I contribute coverage data.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `dumpTime` | `Object` | nil | |
| `id` | `String` | nil | |
| `startTime` | `Object` | nil | |

"
Class {
	#name : #FamixCoverageSession,
	#superclass : #FamixCoverageEntity,
	#instVars : [
		'#id => FMProperty',
		'#startTime => FMProperty',
		'#dumpTime => FMProperty',
		'#reports => FMMany type: #FamixCoverageReport opposite: #sessions'
	],
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageSession class >> annotation [

	<FMClass: #Session super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixCoverageSession >> addReport: anObject [
	<generated>
	^ self reports add: anObject
]

{ #category : #accessing }
FamixCoverageSession >> dumpTime [

	<FMProperty: #dumpTime type: #Object>
	<generated>
	^ dumpTime
]

{ #category : #accessing }
FamixCoverageSession >> dumpTime: anObject [
	<generated>
	dumpTime := anObject
]

{ #category : #accessing }
FamixCoverageSession >> id [

	<FMProperty: #id type: #String>
	<generated>
	^ id
]

{ #category : #accessing }
FamixCoverageSession >> id: anObject [
	<generated>
	id := anObject
]

{ #category : #accessing }
FamixCoverageSession >> reports [
	"Relation named: #reports type: #FamixCoverageReport opposite: #sessions"

	<generated>
	<FMComment: 'Reports to which I contribute coverage data.'>
	^ reports
]

{ #category : #accessing }
FamixCoverageSession >> reports: anObject [

	<generated>
	reports value: anObject
]

{ #category : #accessing }
FamixCoverageSession >> startTime [

	<FMProperty: #startTime type: #Object>
	<generated>
	^ startTime
]

{ #category : #accessing }
FamixCoverageSession >> startTime: anObject [
	<generated>
	startTime := anObject
]
