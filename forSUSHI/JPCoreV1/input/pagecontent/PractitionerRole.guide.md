# 2.1.1.7. JP Core PractitionerRole（医療従事者役割) プロファイル

## 2.1.1.7.1. 概略

<span style="color: ;">医療者が組織で一定期間担当する可能性のある特定の役割/場所/専門分野/サービスのセット。</span>



| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_PractitionerRole |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCorePractitionerRoleProfile                                   |
| タイトル       | JP Core PractitionerRole Profile                               |
| ステータス     | アクティブ（2021-10-25）                                   |
| 定義           | このプロファイルはPractitionerRoleリソースに対して、医療従事者役割のデータを送受信するための基礎となる制約と拡張を定めたものである。                                                     |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)
 |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jppractitionerrole   |



本プロファイルは、PractitionerRoleリソースが医療者の役割を記録、検索、および取得するための最小の期待値を設定する。 これは、このプロファイルを使用するときにPractitionerRoleリソースに存在する必要がある必須のコア要素、拡張機能、語彙、および値セットを識別する。



### 2.1.1.7.1.1. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 医療者の臨床専門分野による医療者役割の検索

- 他のリソースからの医療者役割の参照（例：Encounterリソースのparticipantで参照される患者の関係者の医療者役割）


### 2.1.1.7.1.2. スコープ

医療者役割は、医療者が組織に提供できるサービスの場所と種類の記録をカバーする。

医療者役割の他のインスタンスで必要に応じて、ロール、スペシャリティ、ロケーションテレコム、およびHealthcareServiceプロパティを繰り返すことができる。 単一の場所のサービス値のコレクションを記録するシステムもあれば、単一のサービスとそれが利用可能な場所のリストを記録するシステムもある。 どちらも、このデータを表すための許容可能なオプションである。可用性、通信、またはその他の詳細がすべてのヘルスケアサービス間で同じではない場合、または場所ごとに個別の医療者役割インスタンスを作成する必要がある。


## 2.1.1.7.2. 関連するプロファイル


JP PractitionerRole リソースは、以下のリソースから直接参照される。

- Signature, Account, AdverseEvent, AllergyIntolerance, Appointment, AppointmentResponse, AuditEvent, Basic, BiologicallyDerivedProduct, CarePlan, CareTeam, CatalogEntry, ChargeItem, Claim, ClaimResponse, ClinicalImpression, Communication, CommunicationRequest, Composition, Condition, Consent, Contract, CoverageEligibilityRequest, CoverageEligibilityResponse, DetectedIssue, DeviceRequest, DeviceUseStatement, DiagnosticReport, DocumentManifest, DocumentReference, Encounter, EnrollmentRequest, EnrollmentResponse, EpisodeOfCare, ExplanationOfBenefit, Flag, Goal, Group, ImagingStudy, Immunization, Invoice, Linkage, List, MeasureReport, Media, MedicationAdministration, MedicationDispense, MedicationRequest, MedicationStatement, MedicinalProduct, MessageHeader, NutritionOrder, Observation, Patient, PaymentNotice, PaymentReconciliation, Procedure, Provenance, QuestionnaireResponse, RequestGroup, ResearchStudy, RiskAssessment, Schedule, ServiceRequest, Specimen, SupplyDelivery, SupplyRequest, Task, VerificationResult and VisionPrescription

JP Core PractitionerRole リソースは、以下のリソースを直接参照する。

- Practitioner, Organization, Location, HealthcareService and Endpoint



## 2.1.1.7.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jppractitionerrole)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jppractitionerrole/$download?format=json)

{{tree:jp-core-draftv1/jppractitionerrole}}


### 2.1.1.7.3.1. 必須要素

 JP Core PractitionerRole リソースで定義された必須要素は特にありません。


  

### 2.1.1.7.3.2. Extensions定義

 JP Core PractitionerRole リソースで定義された拡張は特にありません。


   

### 2.1.1.7.3.3. 用語定義




| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| PractitionerRole.code | 医療者が組織のために担当することを許可されている役割 | Example          | JP用語集 |
| PractitionerRole.specialty | 医療者の特定の専門性 |           | 推奨値なし |
| PractitionerRole.availableTime.daysOfWeek | 開始時刻と終了時刻の間の利用可能な曜日 | Required          | [DaysOfWeek](http://hl7.org/fhir/valueset-days-of-week.html) |



### 2.1.1.7.3.4. 制約一覧

制約はありません。


## 2.1.1.7.4. 利用方法

### 2.1.1.7.4.1. インタラクション一覧

<span style="color: red;">★★コメント ： 説明のための例示です。内容の妥当性は考慮していません。★★</span>



| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |



### 2.1.1.7.4.2. OperationおよびSearch Parameter 一覧




#### 2.1.1.7.4.2.1. Search Parameter一覧



| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | specialty    | token  | GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy\|208D0000X |
| SHALL            | practitioner    | token  | GET [base]/PractitionerRole?practitioner.identifier=http://hl7.org/fhir/sid/us-npi\|97860456 |



##### 2.1.1.7.4.2.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. specialty 検索パラメータを使用して、医療者の特定の専門性によるPractitionerRoleの検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/PractitionerRole?specialty={system|}[code]
   ```

   例：

   ```http
   GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy|208D0000X
   ```

   指定された医療者の特定の専門性に一致するPractitionerRoleリソースを含むBundleを検索する。

   

2. practitioner 検索パラメータを使用して、医療者の名前と識別子によるPractitionerRoleの検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/PractitionerRole?practitioner={Type/}[id]
   ```

   例：

   ```http
   1.GET [base]/PractitionerRole?practitioner.identifier=http://hl7.org/fhir/sid/us-npi|97860456&_include=PractitionerRole:practitioner&_include=PractitionerRole?endpoint
   2.GET [base]/PractitionerRole?practitioner.name=山田&_include=PractitionerRole:practitioner&_include=PractitionerRole?endpoint
   ```

   practitioner.nameまたはpractitioner.identifierの連結パラメータに一致するPractitionerRoleリソースを含むBundleを検索する。PractionerRole.practitionerとPractitionerRole.endpointの_include検索をサポートすることが望ましい。（SHOULD）

   

##### 2.1.1.7.4.2.1.2. 推奨検索パラメータ

推奨検索パラメータはありません。


##### 2.1.1.7.4.2.1.3. 追加検索パラメータ 

追加検索パラメータはありません。





#### 2.1.1.7.4.2.2. Operation一覧

PractitionerRoleに対するOperationは定義されていません。



### 2.1.1.7.4.3. サンプル


```JSON
{
  "resourceType": "PractitionerRole",
  "id": "example",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\t\t\t<p>\n\t\t\t\tアダム・ケアフル博士は、2012年1月1日から2012年3月31日までアクメ病院の紹介医です。\n\t\t\t\t2012\n\t\t\t</p>\n\t\t</div>"
  },
  "identifier": [
    {
      "system": "http://www.acme.org/practitioners",
      "value": "23"
    }
  ],
  "active": true,
  "period": {
    "start": "2012-01-01",
    "end": "2012-03-31"
  },
  "practitioner": {
    "reference": "Practitioner/example",
    "display": "アダム・ケアフル博士"
  },
  "organization": {
    "reference": "Organization/f001"
  },
  "code": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0286",
          "code": "RP"
        }
      ]
    }
  ],
  "specialty": [
    {
      "coding": [
        {
          "system": "http://snomed.info/sct",
          "code": "408443003",
          "display": "General medical practice"
        }
      ]
    }
  ],
  "location": [
    {
      "reference": "Location/1",
      "display": "南ウィング, 2階"
    }
  ],
  "healthcareService": [
    {
      "reference": "HealthcareService/example"
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "(03) 5555 6473",
      "use": "work"
    },
    {
      "system": "email",
      "value": "adam.southern@example.org",
      "use": "work"
    }
  ],
  "availableTime": [
    {
      "daysOfWeek": [
        "mon",
        "tue",
        "wed"
      ],
      "availableStartTime": "09:00:00",
      "availableEndTime": "16:30:00"
    },
    {
      "daysOfWeek": [
        "thu",
        "fri"
      ],
      "availableStartTime": "09:00:00",
      "availableEndTime": "12:00:00"
    }
  ],
  "notAvailable": [
    {
      "description": "アダム博士は2017年5月中に長期休暇を取る予定です。",
      "during": {
        "start": "2017-05-01",
        "end": "2017-05-20"
      }
    }
  ],
  "availabilityExceptions": "祝祭日やクリスマス・年末年始の休暇中は、アダム博士は休日です。",
  "endpoint": [
    {
      "reference": "Endpoint/example"
    }
  ]
}

```



## 2.1.1.7.5. 注意事項


PractitionerRoleには、ここで定義されているlocationに住所が含まれているため、addressはありません。
これにより、複数のリソースにaddressの値を重複させる必要がなくなります。





## 2.1.1.7.6. その他、参考文献・リンク等

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




