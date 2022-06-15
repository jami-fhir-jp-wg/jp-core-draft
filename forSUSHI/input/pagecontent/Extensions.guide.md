# 2.2. Extensions （拡張）
---

JP Coreにて独自定義を行ったExtensions(拡張）を以下に列挙する。


|主な利用<br/>プロファイル|タイトル|Extension|説明|その他利用<br/>プロファイル|
|---|---|---|---|
|患者|人種| {{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race}}|人種(Race)に関する情報を格納する|
|保険|被保険者証記号|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSymbol}}|健康保険における被保険者証記号|
|保険|被保険者証番号|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonNumber}}<br/>|健康保険における被保険者証番号|
|保険|被保険者証番号の枝番|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSubNumber}}|健康保険における被保険者証番号の枝番|
|組織|点数表コード|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory}}|点数表コード（１桁）<br/>`医科:1 歯科:3`|
|組織|保険医療機関番号|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo}}|保険医療機関番号（７桁）|
|組織|都道府県番号|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo}}|都道府県番号（２桁）|
|身体計測|部位の左右区別|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition}}|部位（bodySite）の左右の区別|
|薬剤リスト|RP内の薬剤の連番|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo}}|RP内の薬剤の連番|薬剤処方（注射）<br/>処方調剤・払い出し記録（注射）|
|薬剤リスト|力価区分|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType}}|投与量が製剤単位か成分単位かを格納する|薬剤処方（注射）<br/>処方調剤・払い出し記録（注射）|
|薬剤処方<br/>（内服・外用）|服用開始日|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse}}|服用開始日を格納する|処方調剤・払い出し記録（内服・外用）|
|薬剤処方<br/>（内服・外用）|実服用日数|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration}}|実服用日数を格納する|処方調剤・払い出し記録（内服・外用）|
|薬剤処方<br/>（内服・外用・注射）|調剤指示|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense}}|薬剤単位の調剤指示を格納する|
|薬剤処方<br/>（内服・外用・注射）|頓用回数|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount}}|頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する|
|薬剤処方<br/>（注射）|指示ライン|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line}}|指示ラインを格納する|処方調剤・払い出し記録（注射）<br/>薬剤投与実施（注射）|
|薬剤処方<br/>（注射）|投与装置|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device}}|投与装置を格納する|処方調剤・払い出し記録（注射）|
|処方調剤・払い出し記録<br/>（内服・外用・注射）|薬剤単位の調剤結果|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation}}|薬剤単位の調剤結果を格納する|
|薬剤投与実施<br/>（内服・外用・注射）|依頼科|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment}}|依頼科を格納する|
|薬剤投与実施<br/>（内服・外用・注射）|依頼医|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester}}|依頼医を格納する|
|薬剤投与実施<br/>（内服・外用・注射）|依頼日時|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn}}|依頼日時を格納する|
|薬剤投与実施<br/>（内服・外用・注射）|実施場所|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location}}|実施場所を格納する|
|薬剤投与実施<br/>（注射）|投与経路コメント|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRoute_RouteComment}}|投与経路コメントを格納する|
|薬剤投与実施<br/>（注射）|投与部位コメント|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageSite_SiteComment}}|投与部位コメントを格納する|
|薬剤投与実施<br/>（注射）|手技コメント|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageMethod_MethodComment}}|手技コメントを格納する|
|薬剤投与実施<br/>（注射）|投与速度コメント|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRate_RateComment}}|投与速度コメントを格納する|
|薬剤投与実施<br/>（注射）|ラインコメント|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment}}|ラインコメントを格納する|
|薬剤投与実施<br/>（注射）|未分類コメント|{{link:http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment}}|未分類コメントを格納する|



