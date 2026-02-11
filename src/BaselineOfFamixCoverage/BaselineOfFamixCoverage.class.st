Class {
	#name : 'BaselineOfFamixCoverage',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixCoverage',
	#package : 'BaselineOfFamixCoverage'
}

{ #category : 'baselines' }
BaselineOfFamixCoverage >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self packages: spec.
		self groups: spec ]
]

{ #category : 'baselines' }
BaselineOfFamixCoverage >> groups: spec [

	spec
		group: 'default' with: #( 'model' 'unit' );
		group: 'model'
		with: #( 'Famix-Coverage-Entities' 'Famix-Coverage-Generator' );
		group: 'unit'
		with: #( 'Famix-Coverage-Unit' 'Famix-Coverage-Unit-Tests' )
]

{ #category : 'accessing' }
BaselineOfFamixCoverage >> packages: spec [

	spec
		package: 'Famix-Coverage-Entities';
		package: 'Famix-Coverage-Generator';
		package: 'Famix-Coverage-Unit';
		package: 'Famix-Coverage-Unit-Tests'
]
