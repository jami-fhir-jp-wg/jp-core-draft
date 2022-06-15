Profile: JP_MedicationRequest_Injection
Parent: JP_MedicationRequest
Id: JP_MedicationRequest_Injection
Title: "JP_MedicationRequest_Injection"
Description: "このプロファイルはMedicationRequestリソースに対して、注射薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_Injection"
* ^date = "2021-12-03T16:17:33.415963+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはMedicationRequestリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "患者あるいはグループに対しての注射薬剤処方オーダ"
* . ^definition = "患者への薬の供給と注射や点滴の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。"
// extension 参照宣言
* dosageInstruction.extension contains JP_MedicationRequest_DosageInstruction_Line named Line 0..*
* dosageInstruction.extension contains JP_MedicationRequest_DosageInstruction_Device named Device 0..*
//PeriodOfUse とUsageDurationは、Parent: JP_MedicationRequest で宣言されている。
//
* dosageInstruction.extension[Line] only JP_MedicationRequest_DosageInstruction_Line
* dosageInstruction.extension[Line] ^sliceName = "Line"
* dosageInstruction.extension[Line] ^min = 0
* dosageInstruction.extension[Device] only JP_MedicationRequest_DosageInstruction_Device
* dosageInstruction.extension[Device] ^sliceName = "Device"
* dosageInstruction.extension[Device] ^short = "Device"
* dosageInstruction.extension[Device] ^min = 0
* dosageInstruction.extension[PeriodOfUse] ^max = "0"
* dosageInstruction.extension[UsageDuration] ^max = "0"
* dosageInstruction.timing ^short = "投与タイミング"
* dosageInstruction.timing ^definition = "投与タイミングを記録する。"