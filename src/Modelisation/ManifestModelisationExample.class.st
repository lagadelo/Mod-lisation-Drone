"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestModelisationExample',
	#superclass : 'PackageManifest',
	#category : 'Modelisation-Example-Manifest',
	#package : 'Modelisation',
	#tag : 'Example-Manifest'
}

{ #category : 'code-critics' }
ManifestModelisationExample class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'DroneExample class' #DroneExample)) #'2024-10-23T12:26:57.160133+02:00') )
]
