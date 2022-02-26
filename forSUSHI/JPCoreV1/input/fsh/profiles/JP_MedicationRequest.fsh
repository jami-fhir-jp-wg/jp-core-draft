Profile: JP_MedicationRequest
Parent: JP_MedicationRequestBase
Id: JP_MedicationRequest
Title: "JP_MedicationRequest"
Description: "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2022-01-05T07:41:37.927+00:00"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest"
* ^date = "2022-01-05T07:41:36.2383032+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "患者あるいはグループに対しての処方オーダ"
* . ^definition = "患者への薬の供給と内服・外用薬剤処方の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。JP_MedicationRequestBaseプロファイルからの派生プロファイルである。"
* dosageInstruction.extension[Device] ..0
* dosageInstruction.extension[Device] ^short = "Device"
* dosageInstruction.extension[Line] ..0