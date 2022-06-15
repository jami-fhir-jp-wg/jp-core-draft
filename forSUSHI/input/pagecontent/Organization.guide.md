# 2.1.1.5. JP Core Organization(組織）プロファイル


## 2.1.1.5.1. 概略
<br>
<span style="color:;">何らかの形で集団行動をとることを目的に結成された、公式または非公式に認められた人や組織の集まり。企業、機関、法人、部署、コミュニティグループ、医療行為グループ、支払者／保険者などを含む。</span>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreOrganizationProfile                            |
| タイトル       | JP Core Organization Profile                               |
| ステータス     | アクティブ（2021-11-30）                                   |
| 定義           | このプロファイルはOrganizationリソースに対して、組織情報のデータを送受信するための基礎となる制約と拡張を定めたものである。                                                     |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)
  |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)
  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jporganization   |

<br>

### 2.1.1.5.1.1. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 組織名またはNPIによる検索

## 2.1.1.5.2. スコープ

<span style="color:;"><br>
本リソースは、様々な組織の連絡先やその他の情報を共有するレジストリとして使用することができる。
また参照される組織に必要とするサポート、ドキュメント、メッセージ、またはcontained resourceとして使用することもできる。レジストリを使用する場合、複数のレジストリが存在し、それぞれが異なるタイプやレベルの組織に対応することは十分可能である。<br><br>

<br>

## 2.1.1.5.3. 関連するプロファイル

JP Organization リソースは、以下のリソースから直接参照される。

 - Annotation
 - Identifier
 - Signature
 - UsageContext
 - Account
 - AuditEvent
 - Basic
 - BiologicallyDerivedProduct
 - CapabilityStatement
 - CarePlan
 - CareTeam
 - CatalogEntry
 - ChargeItem
 - Claim
 - ClaimResponse
 - Communication
 - CommunicationRequest
 - Composition
 - Consent
 - Contract
 - Coverage
 - CoverageEligibilityRequest
 - CoverageEligibilityResponse
 - Device
 - DeviceDefinition
 - DeviceRequest
 - DiagnosticReport
 - DocumentManifest
 - DocumentReference
 - Encounter
 - Endpoint
 - EnrollmentRequest
 - EnrollmentResponse
 - EpisodeOfCare
 - ExplanationOfBenefit
 - Flag
 - Goal
 - Group
 - HealthcareService
 - ImagingStudy
 - Immunization
 - ImmunizationEvaluation
 - ImmunizationRecommendation
 - InsurancePlan
 - Invoice
 - Linkage
 - Location
 - MeasureReport
 - Media
 - Medication
 - MedicationDispense
 - MedicationKnowledge
 - MedicationRequest
 - MedicationStatement
 - MedicinalProduct
 - MedicinalProductAuthorization
 - MedicinalProductIngredient
 - MedicinalProductManufactured
 - MedicinalProductPackaged
 - MessageHeader
 - MolecularSequence
 - Observation
 - itself
 - OrganizationAffiliation
 - Patient
 - PaymentNotice
 - PaymentReconciliation
 - Person
 - Practitioner
 - PractitionerRole
 - Procedure
 - Provenance
 - QuestionnaireResponse
 - ResearchStudy
 - ServiceRequest
 - SupplyDelivery
 - SupplyRequest
 - Task
 - VerificationResult


JP Organization リソースは、以下のリソースを直接参照する。

- Endpoint


## 2.1.1.5.4. リソース定義


[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jporganization)


[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jporganization/$download?format=json)


{{tree:jp-core-draftv1/jporganization,snapshot}}


### 2.1.1.5.4.1. 必須要素

次のデータ項目は必須（データが存在しなければならない）これらは、人間が読めるように簡単に説明しています。プロファイル固有の指針と例も提供されている。以下の正式なプロファイル定義では，正式な概要，定義，および用語の要件が示されている。

Organization リソースは、次の要素を持たなければならない。

- identifier ： 
- status of the organization : 
- name ： 
- list of contact information ：
- Endpoint information : 

### 2.1.1.5.4.2. Extensions定義

JP Oraganization リソースで使用される拡張は次の通りである。

- [JP_OrganizationCategory](https://simplifier.net/jp-core-draftv1/jporganizationcategory)

  - 点数表コード１桁（医科１、歯科２）の情報を表す。

- [JP_OrganizationNo](https://simplifier.net/jp-core-draftv1/jporganizationno)

  - 保険医療機関番号７桁を表す。

- [JP_PrefectureNo](https://simplifier.net/jp-core-draftv1/jpprefectureno)

  - 都道府県番号2桁を表す。



### 2.1.1.5.4.3. 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Organization.type | 組織の分類 | Example | [OrgazationalType](https://www.hl7.org/fhir/valueset-organization-type.html) |
| Organization.contact.purpose | 連絡する目的 | Extensible　| [ContactEntityType](https://www.hl7.org/fhir/valueset-contactentity-type.html) |



### 2.1.1.5.4.4. 制約一覧

| id       | レベル | 位置              | 説明                                                         | 式                                                           |
| -------- | ------ | -----------------| ------------------------------------------------------------ | ------------------------------------------------------------ |
| jp-org-1 | Rule   | (base) | 組織は、少なくとも一つ場合によっては複数の名前または識別子を持たなければならない | (identifier.count() + name.count()) > 0|
|  jp-org-2 |  Rule |Organization.address | 組織の住所に「ホーム」を使用することはできない | where(use = 'home').empty() |
| jp-org-3 | Rule| Organization.telecom | 組織のtelecomに「ホーム」を使用することはできない | where(use = 'home').empty()

### 2.1.1.5.4.5. その他

 Organization.identifierには、以下のOraganization(組織)に関連したidentifier(ID情報)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| MedicalInstitutionCode | 医療機関コードを格納する | identifier.system = "http://jpfhir.jp/fhir/Common/CodeSystem/insurance-medical-institution-no" を指定し、医療機関コード(10桁)を同valueに格納する。*7桁医療機関コードは異なるURIとなるので注意すること。  |
| InsurerNumber | 健康保険組合などの保険者の保険者番号を表現する | identifier.system = "urn:oid:1.2.392.100495.20.3.61" を指定し、保険者番号を同valueに格納する。 |


## 2.1.1.5.5. 利用方法

### 2.1.1.5.5.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |


### 2.1.1.5.5.2. OperationおよびSearch Parameter 一覧



### 2.1.1.5.5.3. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD            | identifier    | token  | GET [base]/Organization?identifier=12345|
| SHOULD            | name          | string | GET [base]/Organization?name=Health                            |
| SHOULD           | address | string  | GET [base]/Organization?address=Arbor

#### 2.1.1.5.5.3.1. 必須検索パラメータ
必須検索パラメータ（SHALL）は特にない。

### 2.1.1.5.5.4. 推奨検索パラメータ


次の検索パラメータをサポートすることが望ましい。

1. identifier 検索パラメータを使用して、識別子によるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Organization?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Organization?identifier=http://hl7.org/fhir/sid/us-npi|123456
   ```

   指定された識別子に一致するOrganizationリソースを含むBundleを検索する。
   
2. name 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Organization?name={string}
   ```

   例：

   ```
   GET [base]/Organization?name=Health
   ```

3. address 検索パラメータを使用して、addressによるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Organization?address=[string]
   ```

   例：

   ```
   GET [base]/Organization?address=Arbor
   ```

### 2.1.1.5.5.5. オプション検索パラメータ
オプション検索パラメータ（MAY）は特にない。   

### 2.1.1.5.5.6. Operation一覧
Operationは特にない。

### 2.1.1.5.5.7. サンプル  

```json
    { 
      "resourceType" : "Organization",
      "identifier":  [
         {
            "system": "urn:oid:1.2.392.100495.20.3.21",
            "value": "13"
         },
         {
            "system": "urn:oid:1.2.392.100495.20.3.22",
            "value": "1"
         },
         {
            "system": "urn:oid:1.2.392.100495.20.3.23",
            "value": "9999999"
         }
       ],
      "name": "太郎花子クリニック",
      "address":  [
         {
            "line":  [
                    "東京都文京区向丘３−２−１"
                ],
                "city": "文京区",
                "state": "東京都",
                "country": "JPN"
         }
        ]
    }
```

## 2.1.1.5.6. 注意事項
連絡先情報は2箇所に記載がある。1つはOrganization自体にあり、一般的な公的組織の連絡先として使用される。もう1つはContactEntity構造を使用した場所であり、特定の目的のために連絡を受けるように組織が指定した人物や関係者に連絡を取るために使用される。
## 2.1.1.5.7. その他、参考文献、リンク等

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
