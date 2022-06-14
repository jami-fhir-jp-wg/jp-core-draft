Extension: JP_Observation_BodySite_BodySitePosition
Id: JP_Observation_BodySite_BodySitePosition
Title: "JP_Observation_BodySite_BodySitePosition"
Description: "部位（bodySite）の左右の区別を表現する際に使用する"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition"
* ^version = "1.0.0"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "Observation.bodySite"
* . ..1
* . ^short = "部位（bodySite）の左右の区別を表現する際に使用する"
* . ^definition = "部位（bodySite）の左右の区別を表現する際に使用する"
* . ^comment = "部位（bodySite）の左右の区別を表現する際に使用する"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition" (exactly)
* value[x] only string or CodeableConcept