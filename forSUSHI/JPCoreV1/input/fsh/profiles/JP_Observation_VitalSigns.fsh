Profile: JP_Observation_VitalSigns
Parent: JP_Observation_Common
Id: JP_Observation_VitalSigns
Title: "JP_Observation_VitalSigns"
Description: "このプロファイルはObservationリソースに対して、バイタルサインのデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_VitalSigns"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "バイタルサインに関する測定や簡単な観察事実（assertion）"
* . ^definition = "バイタルサインに関する測定と簡単な観察事実（assertion）。"
* . ^comment = "バイタルサインに関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category from $vitalSigns-category (preferred)
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.\r\n\r\n【JP仕様】<br>\r\nMEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類１．バイタルサインの「焦点」を基にバリューセットを定義する<br>\r\n具体的なコードについてはSWG6と連携して決定する必要がある（TBD）"
* code from $vitalSigns-code (preferred)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP仕様】<br>\r\n項目についてはMEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類１．バイタルサインを対象とする<br>\r\n具体的なコードについてはSWG6と連携して決定する必要がある（TBD）"
* subject 1..
* subject only Reference(Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n\r\n【JP仕様】<br>\r\n患者"
* encounter 1..
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP仕様】<br>\r\n診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP仕様】<br>\r\neffectiveDateTime：医療者が確認した日時<br>\r\neffectivePeriod：医療者が確認した期間"
* hasMember only Reference(Observation or QuestionnaireResponse or MolecularSequence or JP_Observation_VitalSigns)
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.\r\n\r\n【JP仕様】<br>\r\n関連する参照リソースにJP_Observation_VitalSignsを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or Observation or MolecularSequence or JP_Observation_VitalSigns)
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.\r\n\r\n【JP仕様】<br>\r\n導出元の参照リソースにJP_Observation_VitalSignsを追加"