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
* value[x] only string or CodeableConcept


Profile: JP_Observation_PhysicalExam
Parent: JP_Observation_Common
Id: JP_Observation_PhysicalExam
Title: "JP_Observation_PhysicalExam"
Description: "このプロファイルはObservationリソースに対して、身体所見のデータを送受信するための制約と拡張を定めたものである。"
// extension 参照宣言
* bodySite.extension contains JP_Observation_BodySite_BodySitePosition named JPCoreBodySitePositionExtension 0..*
//
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "身体所見に関する測定や簡単な観察事実（assertion）"
* . ^definition = "身体所見に関する測定や簡単な観察事実"
* . ^comment = "身体所見に関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..1
* category = $observation-category#exam "Exam" (exactly)
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.\r\n\r\n【JP仕様】<br>\r\n基底仕様のカテゴリ「exam」固定とする"
* code = $observation-physicalExam#physical-findings "Physical Findings" (exactly)
* code from $observation-physicalExam_1 (required)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP仕様】<br>\r\n所見の有無を表すコード（固定値）"
* subject 1..
* subject only Reference(Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n\r\n【JP仕様】<br>\r\n患者"
* encounter 1..
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP仕様】<br>\r\n診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP仕様】<br>\r\neffectiveDateTime：医療者が確認した日時<br>\r\neffectivePeriod：医療者が確認した期間"
* value[x] only CodeableConcept
* value[x] from $v2-0136 (required)
* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below.\r\n\r\n【JP仕様】<br>\r\nコードに限定する"
* value[x] ^binding.description = "Codes specifying either Yes or No used in fields containing binary answers generally user-specified."
* bodySite from $observation-bodySite (preferred)
* bodySite ^comment = "Only used if not implicit in code found in Observation.code.  In many systems, this may be represented as a related observation instead of an inline component.   \n\nIf the use case requires BodySite to be handled as a separate resource (e.g. to identify and track separately) then use the standard extension[ bodySite](extension-bodysite.html).\r\n\r\n【JP仕様】<br>\r\n外保連の手術基幹コード（STEM7）の操作対象部位を基にバリューセットを定義する<br>\r\n左右の区別は拡張で表現する<br>\r\n具体的なコードについてはSWG6と連携して決定する必要がある（TBD）"
* bodySite.extension ^slicing.discriminator.type = #value
* bodySite.extension ^slicing.discriminator.path = "url"
* bodySite.extension ^slicing.rules = #open
* bodySite.extension ^min = 0
* bodySite.extension[JPCoreBodySitePositionExtension] only JP_Observation_BodySite_BodySitePosition
* bodySite.extension[JPCoreBodySitePositionExtension] ^sliceName = "JPCoreBodySitePositionExtension"
* bodySite.extension[JPCoreBodySitePositionExtension] ^comment = "左右の区別を表現する際に使用する"
* bodySite.extension[JPCoreBodySitePositionExtension] ^min = 0
* method from $observation-method (preferred)
* method ^comment = "Only used if not implicit in code for Observation.code.\r\n\r\n【JP仕様】<br>\r\n症状・所見マスターの「診察方法」を基にバリューセットを定義する<br>\r\n具体的なコードについてはSWG6と連携して決定する必要がある（TBD）"
* hasMember only Reference(Observation or QuestionnaireResponse or MolecularSequence or JP_Observation_PhysicalExam)
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.\r\n\r\n【JP仕様】<br>\r\n関連する参照リソースにJP_Observation_PhysicalExamを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or Observation or MolecularSequence or JP_Observation_PhysicalExam)
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.\r\n\r\n【JP仕様】<br>\r\n導出元の参照リソースにJP_Observation_PhysicalExamを追加"
* component ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below.\r\n\r\n【JP仕様】<br>\r\n具体的な所見を記載する"
* component.code = $observation-physicalExam#detailed-physical-findings "Detailed Physical Findings" (exactly)
* component.code from $observation-physicalExam_1 (required)
* component.code ^comment = "*All* code-value and  component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP仕様】<br>\r\n具体的な所見を表すコード（固定値）"
* component.value[x] only CodeableConcept or string