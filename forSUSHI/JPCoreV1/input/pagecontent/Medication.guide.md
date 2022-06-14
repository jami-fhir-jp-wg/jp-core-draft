# 2.1.2.1. Medicationリソース（薬剤リスト）

## 2.1.2.1.1. 概略
<br>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication |
| バージョン     | 1.0.0 |
| 名前           | JPCoreMedication|
| タイトル       | JP Core Medication Profile  |
| ステータス     | アクティブ（2021-10-21）                                   |
| 定義           | Medication リソース       |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)                                |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpmedication |

<br>

このプロファイルは薬剤のリストを表現する。注射ではしばしば複数の薬剤が混注して用いられ、不可分であることからMedicationリソースを利用して処方を表現することとした。
主に注射薬剤処方の一部としてMedicationResource, MedicationDispense, MedicationAdministrationリソースと組み合わせて利用する。薬剤リストに使用する用語集は諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での注射関連規格として利用されているJAHIS 注射データ交換規約 Ver 2.1CおよびSS-MIX2 Ver.1.2gを参考にした。

### 2.1.2.1.1.1. 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- 電子カルテから特定の患者で使用された注射オーダに含まれる薬剤情報を構成する
- 退院時サマリや診療情報提供書において注射の投薬情報の一部として記述する
- 各種検査レポートや診断レポートにおいて注射の投薬情報の一部として記述する
- SS-MIX2のOMP-02(注射オーダ)メッセージやJAHIS注射データ交換規約に準拠した注射オーダメッセージの一部としてJSONに変換する

### 2.1.2.1.1.2. スコープ
#### 2.1.2.1.1.2.1. 対象
このプロファイルの対象は注射、注入で使われる薬剤リストを電子的に連携するためのメッセージを記述することである。

#### 2.1.2.1.1.2.2. 対象としないこと
このプロファイルは注射、注入の薬剤で使用される薬剤リストに関するものであり、内服、外用の薬剤については対象としない。

また、このリソースは単独で用いられることはない。

## 2.1.2.1.2. 関連するプロファイル
JP Medicationリソースは、以下のリソースから直接参照される。

- JP Core MedicationRequestリソース
- JP Core MedicationDispenseリソース
- JP Core MedicationAdministrationリソース

JP Medicationリソースが参照するリソースはない。



## 2.1.2.1.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/JPMedication)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/JPMedication/$download?format=json)

{{tree:jp-core-draftv1/JPMedication}}


### 2.1.2.1.3.1. 必須要素
次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

MedicationRequest リソースは、次の要素を持たなければならない。
- status : ステータスは必須であり、JP Coreでは"active"に固定される。
- ingredient.itemCodeableConcept : 医薬品の識別情報であり、JP Coreでは必須である。
- ingredient.strength : 医薬品の投与量であり、JP Coreでは必須である。

Medicationリソースでは、次の要素をサポートしなければならない。
- ingredient.itemCodeableConcept : 医薬品の識別情報
- ingredient.strength : 医薬品の投与量

### 2.1.2.1.3.2. Extensions定義
Medication リソースで使用される拡張は次の通りである。

#### 2.1.2.1.3.2.1. JP Medication 独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|RP内薬剤番号|RP内の薬剤の連番を格納する拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication_Ingredient_DrugNo|integer|
|力価区分|投与量が製剤単位か成分単位かを格納する拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication_atIngredientStrength_StrengthType|CodeableConcept|

#### 2.1.2.1.3.2.2. 既存のExtensionの利用

既存のExtensionで利用するものはない。

### 2.1.2.1.3.3. 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS注射データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 ver 2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|	urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|剤形|MERIT-9(剤形)|http://jpfhir.jp/ePrescription/CodeSystem/merit9-form|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|電子処方箋HL7 FHIR仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|

Medicationの各要素のバインディングは以下の通りである。

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Medication.ingredient.itemCodeableConcept | 医薬品の識別情報 | prefered | HOT7,HOT9,HOT13,YJコード |
| Medication.ingredient.strength.numerator.code | 成分量単位 | prefered | MERIT-9(単位) |
| Medication.ingredient.strength.denominator.code | １回 | prefered | MERIT-9(単位) |

### 2.1.2.1.3.4. 制約一覧
Medication リソースは、以下の制約を満たさなければならない。
- status : JP Coreでは"active"に固定される。

Medicationリソースは、以下の制約を満たさなければならない。
- ingredient.strength.denominator.value : "1"に固定される。
- ingredient.strength.denominator.unit : "回"に固定される。
- ingredient.strength.denominator.system : "urn:oid:1.2.392.100495.20.2.101"に固定される。
- ingredient.strength.denominator.code : "KAI"に固定される。

### 2.1.2.1.3.5. 項目の追加
日本国内の電子カルテシステムでの注射オーダの運用に合わせ、以下の項目を追加した。

* 薬剤番号（拡張「JP_MedicationDrugNo」を使用）
* ⼒価区分の追加（拡張「JP_MedicationStrengthType」を使用）

## 2.1.2.1.4. 利用方法

Medication リソースは単体として用いられないため、検索などはMedicationRequestなどの一部として行われる。

### 2.1.2.1.4.1. サンプル

[MedicationRequest(注射)](https://simplifier.net/guide/jpfhirjp/MedicationRequest2)や[MedicationDispense(注射)](https://simplifier.net/guide/jpfhirjp/MedicationDispense2)、[MedicationAdministration(注射)](https://simplifier.net/guide/jpfhirjp/MedicationAdministration2)を参照すること。

### 2.1.2.1.4.2. 各種コメントの記述方法

Medicationリソースを参照する上位のリソースに記述される。

## 2.1.2.1.5. その他、参考文献・リンク等
1. HL7, FHIR MedicationRequest Resource, http://hl7.org/fhir/medicationrequest.html
1. HL7, FHIR Medication Resource, http://hl7.org/fhir/medication.html
1. HL7, FHIR BodyStructure Resource, http://hl7.org/fhir/bodystructure.html
1. 保健医療福祉情報システム工業会, JAHIS 注射データ交換規約 Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.2, https://www.jahis.jp/standard/detail/id=725
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, http://www2.medis.or.jp/hcode/
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, http://www.jami.jp/jamistd/ssmix2.php
