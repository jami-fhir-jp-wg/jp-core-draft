Profile: JP_MedicationRequest_Injection
Parent: JP_MedicationRequestBase
Id: JP_MedicationRequest_Injection
Title: "JP_MedicationRequest_Injection"
Description: "このプロファイルはJP_MedicationRequestBaseリソースに対して、注射薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_Injection"
* ^date = "2021-12-03T16:17:33.415963+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "患者あるいはグループに対しての注射薬剤処方オーダ"
* . ^definition = "患者への薬の供給と注射や点滴の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。JP_MedicationRequestBaseプロファイルからの派生プロファイルである。"
* dosageInstruction.extension[PeriodOfUse] ..0
* dosageInstruction.extension[UsageDuration] ..0
* dosageInstruction.timing ^short = "投与タイミング"
* dosageInstruction.timing ^definition = "投与タイミングを記録する。"