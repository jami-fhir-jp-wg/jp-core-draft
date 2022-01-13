# 2.1.1.4. JP Core Location（所在場所）プロファイル



## 2.1.1.4.1. 概略

<span style="color: ;">サービスが提供され、リソースや参加者が保管、発見、収容、または宿泊できる物理的な場所の詳細および位置情報。</span>



| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Location |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreLocationProfile                                   |
| タイトル       | JP Core Location Profile                               |
| ステータス     | アクティブ（2021-10-25）                                   |
| 定義           | このプロファイルはLocationリソースに対して、所在場所のデータを送受信するための基礎となる制約と拡張を定めたものである。                                                     |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jplocation   |



本プロファイルは、患者、プロバイダー、または組織に関連付けられたロケーションを記録、検索、およびフェッチするために 、FHIR Location リソースを使用するにあたっての、最低限の制約を記述したものである。Location リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。



### 2.1.1.4.1.1. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 所在場所名または所在場所の住所による所在場所の検索

- 他のリソースからの所在場所の参照（例：Encounterリソースのhospitalizationで参照される患者の入院前や退院後の所在場所）


### 2.1.1.4.1.2. スコープ

所在場所には、偶発的な場所（事前の指定や許可なしに医療に使用される場所）と、正式に指定された専用の場所の両方が含まれる。場所は、プライベート、パブリック、モバイル、または固定であり、小さな冷凍庫から完全な病院の建物または駐車場までの規模になる。本リソースに含まれる所在場所の例を示す（ただし、この一覧に限定されない）。

- 建物、病棟、廊下、部屋またはベッド
- モバイルクリニック
- 冷凍庫、インキュベーター
- 車両またはリフト
- 家、小屋、またはガレージ
- 道路、駐車場、公園
- 救急車（ジェネリック）
- 救急車（特定）
- 患者の家（一般）
- 管轄

これらの所在場所は、何かが発生した患者の所在場所（骨折した部位、例えば足）をカバーすることを目的としていないが、患者が足を骨折した場所（例えば、遊び場）をカバーすることができる。


## 2.1.1.4.2. 関連するプロファイル

<span style="color: red;">★★コメント ： 各JP リソースの参照個所に、JP版リソースが追加されることを前提としています。★★</span>



JP Location リソースは、以下のリソースから直接参照される。

- UsageContext, Account, ActivityDefinition, AdverseEvent, Appointment, AppointmentResponse, AuditEvent, CarePlan, Claim, ClaimResponse, Contract, CoverageEligibilityRequest, Device, DeviceRequest, DiagnosticReport, Encounter, ExplanationOfBenefit, Flag, HealthcareService, ImagingStudy, Immunization, InsurancePlan, List, itself, MeasureReport, Media, MedicationDispense, Observation, OrganizationAffiliation, PractitionerRole, Procedure, Provenance, ResearchStudy, Schedule, ServiceRequest, Specimen, SupplyDelivery, SupplyRequest and Task


JP Core Location リソースは、以下のリソースを直接参照する。

- Organization, Location and Endpoint



## 2.1.1.4.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jplocation)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jplocation/$download?format=json)

{{tree:jp-core-draftv1/jplocation}}


### 2.1.1.4.3.1. 必須要素

JP Core Location リソースで定義された必須要素は特にありません。



  

### 2.1.1.4.3.2. Extensions定義


JP Core Location リソースで定義された拡張は特にありません。


    

### 2.1.1.4.3.3. 用語定義




| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Location.status | 所在場所のステータス | Required          | [LocationStatus](http://hl7.org/fhir/valueset-location-status.html) |
| Location.operationalStatus | 所在場所の運用ステータス（通常、ベッド/部屋のみ） | Preferred          | [v2 BED STATUS](http://hl7.org/fhir/v2/0116/index.html) |
| Location.mode | リソースインスタンスが特定の場所を表すか、場所のクラスを表すかを示すモード | Required          | [LocationMode](http://hl7.org/fhir/valueset-location-mode.html) |
| Location.type | 実行される機能のタイプ | Extensible          | [V3 Value SetServiceDeliveryLocationRoleType](http://hl7.org/fhir/v3/ServiceDeliveryLocationRoleType/vs.html) |
| Location.physicalType | 所在場所の物理的な形、例えば建物、部屋、車両、道路 | Example          | [Location type](http://hl7.org/fhir/valueset-location-physical-type.html) |
| Location.hoursOfOperation.daysOfWeek | 開始時刻と終了時刻の間に利用可能な曜日 | Required          | [DaysOfWeek](http://hl7.org/fhir/valueset-days-of-week.html) |



### 2.1.1.4.3.4. 制約一覧

制約はありません。



## 2.1.1.4.4. 利用方法

### 2.1.1.4.4.1. インタラクション一覧

<span style="color: red;">★★コメント ： 説明のための例示です。内容の妥当性は考慮していません。★★</span>



| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |



### 2.1.1.4.4.2. OperationおよびSearch Parameter 一覧



<span style="color: red;">★★コメント ： サンプルを例示します。説明のための例示であり内容の妥当性は考慮していません。表の形式はテンプレートにあわせましたが、Search Parameter については、US-Coreを参考に、下に書いたような説明や例を追加したため、一覧の表は不要ではないでしょうか。US-Coreにも一覧表はありません。★★</span>





#### 2.1.1.4.4.2.1. Search Parameter一覧



| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | name    | string  | GET [base]/Location?name=３南 |
| SHALL            | address          | string | GET [base]/Location?address=〒113-0033東京都文京区本郷７丁目３−１                            |
| SHOULD           | address-city | stringn  | GET [base]/Location?address-city=文京区    |
| SHOULD           | 
address-state | stringn  | GET [base]/Location?
address-state=東京都    |
| SHOULD           | address-postalcode | stringn  | GET [base]/Location?address-postalcode=1130033    |





##### 2.1.1.4.4.2.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/Location?name=[string]
   ```

   例：

   ```http
   GET [base]/Location?name=３南
   ```

   名前が一致するLocationリソースを含むBundleを取得する。

   

2. address 検索パラメータを使用して、住所テキストによる文字列検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/Location?address=[string]
   ```

   例：

   ```http
   GET [base]/Location?address=〒113-0033東京都文京区本郷７丁目３−１
   ```

   住所文字列が一致するLocationリソースを含むBundleを取得する。

   

##### 2.1.1.4.4.2.1.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. address-city 検索パラメータを使用して、住所の市町村名によるLocationの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/Location?address-city=[string]
   ```

   例：

   ```http
   GET [base]/Location?address-city=文京区
   ```

   指定された住所の市町村名が一致するLocationリソースを含むBundleを取得する。


2. address-state 検索パラメータを使用して、住所の都道府県名によるLocationの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/Location?address-state=[string]
   ```

   例：

   ```http
   GET [base]/Location?address-state=東京都
   ```

   指定された住所の都道府県名が一致するLocationリソースを含むBundleを取得する。


3. address-postalcode 検索パラメータを使用して、住所の郵便番号によるLocationの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/Location?address-postalcode=[string]
   ```

   例：

   ```http
   GET [base]/Location?address-postalcode=1130033
   ```

   指定された住所の郵便番号が一致するLocationリソースを含むBundleを取得する。



##### 2.1.1.4.4.2.1.3. 追加検索パラメータ 

追加検索パラメータはありません。



#### 2.1.1.4.4.2.2. Operation一覧

Locationに対するOperationは定義されていません。



### 2.1.1.4.4.3. サンプル




```JSON
{
  "resourceType": "Location",
  "id": "2",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">バーガー緊急医療センター, 南ウィング, 2階, 神経放射線科　手術室　1</div>"
  },
  "identifier": [
    {
      "value": "B1-S.F2.1.00"
    }
  ],
  "status": "suspended",
  "operationalStatus": {
    "system": "http://terminology.hl7.org/CodeSystem/v2-0116",
    "code": "H",
    "display": "清掃中"
  },
  "name": "南ウィング　神経放射線科　手術室1",
  "alias": [
    "南ウィング　神経放射線科　手術室5",
    "メインウィング　神経放射線科　手術室2"
  ],
  "description": "Old South Wing, Neuro Radiology Operation Room 1 on second floor",
  "mode": "instance",
  "type": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
          "code": "RNEU",
          "display": "神経放射線科ユニット"
        }
      ]
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "2329"
    }
  ],
  "physicalType": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code": "ro",
        "display": "部屋"
      }
    ]
  },
  "managingOrganization": {
    "reference": "Organization/f001"
  },
  "partOf": {
    "reference": "Location/1"
  }
}

```



## 2.1.1.4.5. 注意事項


注意事項はありません。






## 2.1.1.4.6. その他、参考文献・リンク等

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


