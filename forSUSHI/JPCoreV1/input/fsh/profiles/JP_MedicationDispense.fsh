Profile: JP_MedicationDispense
Parent: JP_MedicationDispenseBase
Id: JP_MedicationDispense
Title: "JP_MedicationDispense"
Description: "このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense"
* ^date = "2021-12-03T15:35:21.0508205Z"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダーに対して薬局システムが対応した結果となる。"
* dosageInstruction.extension[Device] 0..0
* dosageInstruction.extension[Line] 0..0