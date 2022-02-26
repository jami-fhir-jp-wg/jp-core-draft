Profile: JP_MedicationAdministration_Injection
Parent: JP_MedicationAdministration
Id: JP_MedicationAdministration_Injection
Title: "JP_MedicationAdministration_Injection"
Description: "このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
// extension 参照宣言
* extension contains JP_MedicationAdministration_UncategorizedComment named UncategorizedComment 0..*
* dosage.extension contains JP_MedicationRequest_DosageInstruction_Line named Line 0..*
* dosage.extension contains JP_MedicationAdministration_Dosage_LineComment named LineComment 0..*
* dosage.extension contains JP_MedicationAdministration_Dosage_DosageComment named DosageComment 0..*
* dosage.site.extension contains JP_MedicationAdministration_DosageSite_SiteComment named SiteComment 0..*
* dosage.route.extension contains JP_MedicationAdministration_DosageRoute_RouteComment named RouteComment 0..*
* dosage.method.extension contains JP_MedicationAdministration_DosageMethod_MethodComment named MethodComment 0..*
* dosage.rate[x].extension contains JP_MedicationAdministration_DosageRate_RateComment named RateComment 0..*
// 
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection"
* ^date = "2021-12-25T14:32:12.4448275+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^copyright = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "患者への注射薬剤投与記録"
* extension contains JP_MedicationAdministration_UncategorizedComment named UncategorizedComment 0..*
* extension[UncategorizedComment] ^definition = "未分類コメントを格納するための拡張"
* extension[UncategorizedComment] ^min = 0
* dosage.extension ^slicing.discriminator.type = #value
* dosage.extension ^slicing.discriminator.path = "url"
* dosage.extension ^slicing.rules = #open
* dosage.extension ^min = 0
* dosage.extension contains
    JP_MedicationRequest_DosageInstruction_Line named Line 0..* and
    JP_MedicationAdministration_Dosage_LineComment named LineComment 0..* and
    JP_MedicationAdministration_Dosage_DosageComment named DosageComment 0..*
* dosage.extension[Line] ^min = 0
* dosage.extension[LineComment] ^short = "ラインコメント"
* dosage.extension[LineComment] ^definition = "ラインコメントを格納するための拡張"
* dosage.extension[LineComment] ^min = 0
* dosage.extension[DosageComment] ^short = "用法コメント"
* dosage.extension[DosageComment] ^definition = "用法コメントを格納するための拡張"
* dosage.extension[DosageComment] ^min = 0
* dosage.site.extension ^slicing.discriminator.type = #value
* dosage.site.extension ^slicing.discriminator.path = "url"
* dosage.site.extension ^slicing.rules = #open
* dosage.site.extension ^min = 0
* dosage.site.extension[SiteComment] only JP_MedicationAdministration_DosageSite_SiteComment
* dosage.site.extension[SiteComment] ^sliceName = "SiteComment"
* dosage.site.extension[SiteComment] ^short = "投与部位コメント"
* dosage.site.extension[SiteComment] ^definition = "投与部位コメントを格納するための拡張"
* dosage.site.extension[SiteComment] ^min = 0
* dosage.route.extension ^slicing.discriminator.type = #value
* dosage.route.extension ^slicing.discriminator.path = "url"
* dosage.route.extension ^slicing.rules = #open
* dosage.route.extension ^min = 0
* dosage.route.extension[RouteComment] only JP_MedicationAdministration_DosageRoute_RouteComment
* dosage.route.extension[RouteComment] ^sliceName = "RouteComment"
* dosage.route.extension[RouteComment] ^short = "投与経路コメント"
* dosage.route.extension[RouteComment] ^definition = "投与経路コメントを格納するための拡張"
* dosage.route.extension[RouteComment] ^min = 0
* dosage.method.extension ^slicing.discriminator.type = #value
* dosage.method.extension ^slicing.discriminator.path = "url"
* dosage.method.extension ^slicing.rules = #open
* dosage.method.extension ^min = 0
* dosage.method.extension[MethodComment] only JP_MedicationAdministration_DosageMethod_MethodComment
* dosage.method.extension[MethodComment] ^sliceName = "MethodComment"
* dosage.method.extension[MethodComment] ^min = 0
* dosage.rate[x].extension ^slicing.discriminator.type = #value
* dosage.rate[x].extension ^slicing.discriminator.path = "url"
* dosage.rate[x].extension ^slicing.rules = #open
* dosage.rate[x].extension ^min = 0
* dosage.rate[x].extension[RateComment] only JP_MedicationAdministration_DosageRate_RateComment
* dosage.rate[x].extension[RateComment] ^sliceName = "RateComment"
* dosage.rate[x].extension[RateComment] ^min = 0