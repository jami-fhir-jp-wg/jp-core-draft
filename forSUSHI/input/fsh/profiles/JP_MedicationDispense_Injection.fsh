Profile: JP_MedicationDispense_Injection
Parent: JP_MedicationDispense
Id: JP_MedicationDispense_Injection
Title: "JP_MedicationDispense_Injection"
Description: "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection"
* ^date = "2021-12-25T14:35:21.0508205Z"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* dosageInstruction.extension contains JP_MedicationRequest_DosageInstruction_Device named Device 0..*
* dosageInstruction.extension contains JP_MedicationRequest_DosageInstruction_Line named Line 0..*
* dosageInstruction.extension[Device] only JP_MedicationRequest_DosageInstruction_Device
* dosageInstruction.extension[Device] ^sliceName = "Device"
* dosageInstruction.extension[Device] ^short = "投与機器の情報"
* dosageInstruction.extension[Device] ^definition = "投与機器の情報を記述する拡張。"
* dosageInstruction.extension[Device] ^min = 0
* dosageInstruction.extension[Line] only JP_MedicationRequest_DosageInstruction_Line
* dosageInstruction.extension[Line] ^sliceName = "Line"
* dosageInstruction.extension[Line] ^short = "投与ラインの情報"
* dosageInstruction.extension[Line] ^definition = "投与ラインの情報を記述する拡張。"
* dosageInstruction.extension[Line] ^min = 0
* dosageInstruction.extension[UsageDuration] 0..0
* dosageInstruction.extension[PeriodOfUse] 0..0