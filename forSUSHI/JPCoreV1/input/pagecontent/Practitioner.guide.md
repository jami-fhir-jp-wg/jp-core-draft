# 2.1.1.6. JP Core Practitioner(医療従事者) プロファイル

## 2.1.1.6.1. 概略

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Practitioner |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCorePratitionerProfile                                   |
| タイトル       | JP Core Practitioner Profile                               |
| ステータス     | アクティブ（2021-11-02）                                   |
| 定義           | このプロファイルはPractitionerリソースに対して、医療従事者のデータを送受信するための基礎となる制約と拡張を定めたものである。                                                     |
| 公開者         |  FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright      |  FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jppractitioner   |


本プロファイルは、医療従事者に関する情報の登録や検索、取得のために 、FHIR Practitioner リソースを使用するにあたっての、最低限の制約を記述したものである。Practitioner リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

### 2.1.1.6.1.1. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 氏名または医籍登録番号による医療従事者の検索

- 他のリソースからの医療従事者情報の参照（例：Patientリソースの generalPractitionerで参照される患者の主治医や、Encounterリソースのparticipantで参照される診察の担当医）


### 2.1.1.6.1.2. スコープ

医療（ヘルスケア）の提供、及び、ヘルスケア関連サービスに、直接的、または、間接的に係わる全ての人を表す。本リソースに含まれる医療従事者の例を示す（ただし、この一覧に限定されない）。

- 医師、歯科医師、薬剤師
- 看護師、保健師、医療クラーク
- 助産師、栄養士、心理士
- 臨床検査技師、放射線技師
- 臨床工学技士、義肢装具士
- 医療事務者（受付担当者）

本リソースは、友人や親戚、隣人のケアをする個人のように、正式な責任を持たずに医療に関与する個人を表現するために使用してはならない。それらの情報は、患者の関係者として RelatedPerson リソースを使用して表現されるべきである。

Practitioner リソースは、ヘルスケアサービスの提供組織を代表し、複数の患者のために行動する個人に対して使用される。一方で、RelatedPerson リソースは、特定の組織に関連づけられておらず、特定の患者に関係する個人を表現するために使用される。

PractitionerRole リソースは、医療従事者が、特定の組織において与えられている役割の詳細を表す。特定の施設に関係しない資格や識別子（例：医籍番号や麻薬施用者免許証番号）は、Practitioner リソースに記録することが望ましい。一方で、特定の施設における医療従事者の識別子や役割（例：特定の医療機関における医療従事者ID）は、施設を表すOrganizationリソースとあわせて PractitionerRole リソースに記録することが望ましい。



## 2.1.1.6.2. 関連するプロファイル


JP Practitioner リソースは、以下のリソースから直接参照される。

 - Annotation
 - Signature
 - Account
 - AdverseEvent
 - AllergyIntolerance
 - Appointment
 - AppointmentResponse
 - AuditEvent
 - Basic
 - BiologicallyDerivedProduct
 - CarePlan
 - CareTeam
 - CatalogEntry
 - ChargeItem
 - Claim
 - ClaimResponse
 - ClinicalImpression
 - Communication
 - CommunicationRequest
 - Composition
 - Condition
 - Consent
 - Contract
 - CoverageEligibilityRequest
 - CoverageEligibilityResponse
 - DetectedIssue
 - DeviceRequest
 - DeviceUseStatement
 - DiagnosticReport
 - DocumentManifest
 - DocumentReference
 - Encounter
 - EnrollmentRequest
 - EnrollmentResponse
 - EpisodeOfCare
 - ExplanationOfBenefit
 - Flag
 - Goal
 - Group
 - ImagingStudy
 - Immunization
 - Invoice
 - Linkage
 - List
 - MeasureReport
 - Media
 - MedicationAdministration
 - MedicationDispense
 - MedicationRequest
 - MedicationStatement
 - MessageHeader
 - NutritionOrder
 - Observation
 - Patient
 - PaymentNotice
 - PaymentReconciliation
 - Person
 - PractitionerRole
 - Procedure
 - Provenance
 - QuestionnaireResponse
 - RequestGroup
 - ResearchStudy
 - RiskAssessment
 - Schedule
 - ServiceRequest
 - Specimen
 - SupplyDelivery
 - SupplyRequest
 - Task
 - VerificationResult
 - VisionPrescription

JP Practitioner リソースは、以下のリソースを直接参照する。

- Organization 


## 2.1.1.6.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jppractitioner)


[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jppractitioner/$download?format=json)


{{tree:jp-core-draftv1/jppractitioner,snapshot}}


### 2.1.1.6.3.1. 必須要素


次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

JP Practitioner リソースには、必須要素はありません。

  
### 2.1.1.6.3.2. Extensions定義

JP Practitioner リソースで使用される拡張は次の通りである。

#### 2.1.1.6.3.2.1. 既存のExtensionの利用

- [NameRepresentationUse]("http://hl7.org/fhir/R4/extension-iso21090-en-representation.html")

  - 医療従事者氏名(Practitioner.name)の漢字表記・カナ表記識別のために使用する。

### 2.1.1.6.3.3. 用語定義



| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Practitioner.gender.code | 医療従事者の性別 | required          | [AdministrativeGender](http://hl7.org/fhir/valueset-administrative-gender.html) |
| Practitioner.communication | 医療従事者の使用できる言語 | Preferred, but limited to ALLLanguage          | [CommonLanguages](http://hl7.org/fhir/valueset-languages.html) |



### 2.1.1.6.3.4. 制約一覧


制約はありません。


### 2.1.1.6.3.5. その他

 Practitioner.qualificationには、以下の医療従事者のqualification(資格)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| DrugUserQualification | 麻薬施用者免許番号を表現する | qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.32.[都道府県番号]" を指定し、麻薬取扱免許番号を同valueに格納する。<br> [都道府県番号](https://www.mhlw.go.jp/topics/2007/07/dl/tp0727-1d.pdf)  |
| MedicalRegistrationNumber | 医籍登録者番号を表現する | qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.31" を指定し、医籍登録者番号を同valueに格納する。 |



## 2.1.1.6.4. 利用方法

### 2.1.1.6.4.1. インタラクション一覧


| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |



### 2.1.1.6.4.2. OperationおよびSearch Parameter 一覧


#### 2.1.1.6.4.2.1. Search Parameter一覧


| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Practitioner?identifier=http://myhospital.com/fhir/drid\|789 |
| SHALL            | name          | string | GET [base]/Practitioner?name=山田                            |


##### 2.1.1.6.4.2.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、医療従事者番号などの識別子によるPractitionerの検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Practitioner?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Practitioner?identifier=http://myhospital.com/fhir/drid|123456
   ```

   指定された識別子(identifier)に一致するPractitionerリソースを含むBundleを検索する。

   

2. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Practitioner?name=[string]
   ```

   例：

   ```
   GET [base]/Practitioner?name=山田
   ```

   名前（姓:family、名:given、またはテキスト:text）が一致するPractitionerリソースを含むBundleを検索する。

   

##### 2.1.1.6.4.2.1.2. 推奨検索パラメータ

推奨検索パラメータ(SHOULD)はありません。


##### 2.1.1.6.4.2.1.3. オプション検索パラメータ 

オプション検索パラメータ(MAY)はありません。

#### 2.1.1.6.4.2.2. Operation一覧

Operationはありません。

### 2.1.1.6.4.3. サンプル

```JSON
{
  "resourceType": "Practitioner",
  "id": "example",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>神奈川　花子</li><li>カナガワ　ハナコ</li><li>麻薬施用者免許番号：4-321</li></ul></div>"
  },
  "name": [
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode": "IDE"
        }
      ],
      "text": "神奈川花子",
      "family": "神奈川",
      "given": [
        "花子"
      ]
    },
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode": "SYL"
        }
      ],
      "text": "カナガワハナコ",
      "family": "カナガワ",
      "given": [
        "ハナコ"
      ]
    }
  ],
  "qualification": [
    {
      "identifier": [
        {
          "system": "urn:oid:1.2.392.100495.20.3.32.13",
          "value": "4-321"
        }
      ],
      "code": {
        "Coding": [
          {
            "system": "http://hl7.jp/fhir/ePrescription/certificate",
            "code": "NarcoticsPractitioner"
          }
        ]
      }
    }
  ]
}
```



## 2.1.1.6.5. 注意事項

注意事項はありません。

## 2.1.1.6.6. その他、参考文献・リンク等

・退院時サマリー規約
http://www.hl7.jp/library/item/HL7J-CDA-007.pdf

・診療情報提供書規格
http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf

・特定健診情報ファイル仕様
https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html

・SS-MIX2 標準化ストレージ 仕様書 Ver.1.2f
http://www.jami.jp/jamistd/docs/SS-MIX2/f/SS-MIX2_StndrdStrgSpecVer.1.2f.pdf

・ICSR E2B(R3)
https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html

