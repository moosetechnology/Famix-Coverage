Class {
	#name : #FamixCoverageGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'report',
		'session',
		'group',
		'package',
		'class',
		'method',
		'file',
		'line',
		'tPackage',
		'tClass',
		'tMethod',
		'tWithGroups',
		'tWithPackages',
		'tWithCoverage',
		'tNamedEntity'
	],
	#category : #'Famix-Coverage-Generator'
}

{ #category : #accessing }
FamixCoverageGenerator class >> packageName [

	^ #'Famix-Coverage-Entities'
]

{ #category : #accessing }
FamixCoverageGenerator class >> prefix [

	^ #FamixCoverage
]

{ #category : #accessing }
FamixCoverageGenerator class >> submetamodels [

	^ { FamixGenerator }
]

{ #category : #definition }
FamixCoverageGenerator >> defineClasses [

	report := builder newClassNamed: #Report.
	session := builder newClassNamed: #Session.

	group := builder newClassNamed: #Group.
	package := builder newClassNamed: #Package.
	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.

	file := builder newClassNamed: #File.
	line := builder newClassNamed: #Line
]

{ #category : #definition }
FamixCoverageGenerator >> defineHierarchy [

	report --|> tWithCoverage.
	group --|> tWithCoverage.
	package --|> tWithCoverage.
	class --|> tWithCoverage.
	method --|> tWithCoverage.
	file --|> tWithCoverage.

	report --|> tWithGroups.
	group --|> tWithGroups.

	report --|> tWithPackages.
	package --|> tWithPackages.

	report --|> tNamedEntity.
	group --|> tNamedEntity
]

{ #category : #definition }
FamixCoverageGenerator >> defineProperties [

	tWithCoverage property: #instructionCoverage type: #Number.
	tWithCoverage property: #branchCoverage type: #Number.
	tWithCoverage property: #lineCoverage type: #Number.
	tWithCoverage property: #complexity type: #Number.
	tWithCoverage property: #methodCoverage type: #Number.
	tWithCoverage property: #classCoverage type: #Number.

	session property: #id type: #String.
	session property: #startTime type: #Object.
	session property: #dumpTime type: #Object.

	file property: #path type: #String.

	line property: #number type: #Number.
	line property: #missedInstructions type: #Number.
	line property: #coveredInstructions type: #Number.
	line property: #missedBranches type: #Number.
	line property: #coveredBranches type: #Number
]

{ #category : #definition }
FamixCoverageGenerator >> defineRelations [

	((report property: #sessions) comment:
		 'Sessions that contribute coverage data.')
	*-* ((session property: #reports) comment:
			 'Reports to which I contribute coverage data.').

	(file property: #lines) -* (line property: #file).

	(tWithGroups property: #groups) -* (group property: #container).
	(tWithPackages property: #packages) -* (package property: #container).

	"relations to Famix"
	(package property: #coveredPackage)
	*- (tPackage property: #coverages).
	(class property: #coveredClass) *- (tClass property: #coverages).
	(method property: #coveredMethod) *- (tMethod property: #coverages)
]

{ #category : #definition }
FamixCoverageGenerator >> defineTraits [

	tWithCoverage := builder newTraitNamed: #TWithCoverage.
	tWithGroups := builder newTraitNamed: #TWithGroups.
	tWithPackages := builder newTraitNamed: #TWithPackages.

	tPackage := self remoteTrait: #TPackage withPrefix: #Famix.
	tClass := self remoteTrait: #TClass withPrefix: #Famix.
	tMethod := self remoteTrait: #TMethod withPrefix: #Famix.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #Famix
]
