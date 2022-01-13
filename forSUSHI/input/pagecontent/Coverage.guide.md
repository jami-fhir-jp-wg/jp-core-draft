# 2.1.1.2. JP Core Coverage （保険・公費）プロファイル


## 2.1.1.2.1. 概略
<br>
<span style="color:;">医療機関や薬局、介護サービス等の支払いや償還に利用する保険や公費等のこと。保険適用だけでなく自己負担の場合もこのリソースを利用する。</span>



| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Coverage |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreCoverageProfile                                   |
| タイトル       | JP Core Coverage Profile                               |
| ステータス     | アクティブ（2021-11-24）                                   |
| 定義           | このプロファイルはCoverageリソースに対して、保険・公費のデータを送受信するための基礎となる制約と拡張を定めたものである。                                                     |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpcoverage   |

<br>

### 2.1.1.2.1.1. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 病院の電子カルテシステムや医事システム、診療所や調剤薬局のシステム、介護サービスを提供する施設のシステム等において、サービス利用者（患者）の支払いに適用する保険や公費の種類、自己負担割合や自己負担上限額などを管理する
- サービス利用者や保険者が実際に支払う負担額を管理する
- サービス利用者や保険者を除く個人又は組織が支払いの全額又は一部に責任を持つ場合の負担額を管理する

## 2.1.1.2.2. スコープ

<span style="color:;"><br>
Coverageリソースは、医療・介護保険における識別子・記述子を提供することを想定しており、典型的には保険証に記載される情報であり、医療や介護サービスの提供に対する対価として、一部または全ての支払いに使用される可能性があるものである。

このリソースは、保険者以外の個人または組織が医療費の一部の支払いに責任を持つ「自己負担」を登録するためにも使用することができる。ここで定義する「自己負担」は、患者の支払いの保証人になることとは別のものであることに留意する。

Coverage リソースは、FHIRワークフローの観点からは「イベント」に該当するリソースである。詳細はWorkflowの項目を参照のこと。<br><br>

<br>

## 2.1.1.2.3. 関連するプロファイル

JP Coverage リソースは、以下のリソースから直接参照される。

- Account, Claim, ClaimResponse, CoverageEligibilityRequest, CoverageEligibilityResponse, DeviceRequest, EnrollmentRequest, ExplanationOfBenefit, MedicationRequest, ServiceRequest and Task

<br>
JP Coverage リソースには、直接参照するリソースは存在しない。
<br><br>


## 2.1.1.2.4. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpcoverage)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpcoverage/$download?format=json)

{{tree:jp-core-draftv1/jpcoverage}}

<br>

### 2.1.1.2.4.1. 必須要素

Coverage リソースは、次の要素を必ず持たなければならない。

- status ： 「リソースのインスタンスの状態」を示すエレメント。
- beneficiary : 「サービスを受ける者」を示すエレメント。Patientリソースを参照する。
- payor ： 「負担者」を示すエレメント。Organaization、Patient、RelatedPersonのいずれかを参照する。

<br><br>


### 2.1.1.2.4.2. Extensions定義

JP Core Coverage プロファイルで使用される拡張は次の通りである。
- [JP_Coverage_InsuredPersonSymbol](https://simplifier.net/jp-core-draftv1/jpcoverageinsuredpersonsymbol)
    - 健康保険における被保険者証記号を示す拡張。
- [JP_Coverage_InsuredPersonNumber](https://simplifier.net/jp-core-draftv1/jpcoverageinsuredpersonnumber)
    - 健康保険における被保険者証番号を示す拡張。
- [JP_Coverage_InsuredPersonSubNumber](https://simplifier.net/jp-core-draftv1/jpcoverageinsuredpersonsubnumber)
    - 健康保険における被保険者証番号の枝番を示す拡張。

<br><br>


### 2.1.1.2.4.3. 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Coverage.status | インスタンスの状態を指定するcode。 | Required | [FinancialResourceStatusCodes](https://www.hl7.org/fhir/valueset-fm-status.html) |
| Coverage.type | 保険種別（国民健康保険、公害医療、労災、地方公費など）を表すCodeableConcept。<br>JAHIS病名情報交換規約、又は電子処方箋CDA記述仕様のコード表を参照することができる。 | Preferred　|  [JAHIS病名情報データ交換規約・JHSD0001](https://www.jahis.jp/standard/detail/id=134) <br> [電子処方箋CDA記述仕様・別表11](https://www.mhlw.go.jp/content/10800000/000342368.pdf)|
| Coverage.relationship | 患者と被保険者の関係を表すCodeableConcept。<br>JAHIS病名情報交換規約、又は電子処方箋CDA記述仕様のコード表を参照することができる。 | Extensible | [JAHIS病名情報データ交換規約・HL7表0063](https://www.jahis.jp/standard/detail/id=134) <br> [電子処方箋CDA記述仕様・別表12](https://www.mhlw.go.jp/content/10800000/000342368.pdf) |
| Coverage.costToBeneficiary.type | 患者の自己負担額に関するサービスや負担率、上限額等の種類を指定するCodeableConcept。 | Extensible | [CoverageCopayTypeCodes](https://www.hl7.org/fhir/valueset-coverage-copay-type.html) |


<br>
### 2.1.1.2.4.4. 制約一覧

JP Coverage リソースには、制約は存在しない。
<br><br>

## 2.1.1.2.5. 利用方法
<br>

### 2.1.1.2.5.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

<br>

### 2.1.1.2.5.2. OperationおよびSearch Parameter 一覧

<br>

#### 2.1.1.2.5.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD            | beneficiary   | 	reference  | GET [base]/Coverage?beneficiary=*** |
| SHOULD            | class-type    | token | GET [base]/Coverage.class?type=****                            |
| SHOULD           | class-value | string  | GET [base]/Coverage.class?value=***
| SHOULD           | dependent | string  | GET [base]/Coverage?dependent=***
| SHOULD           | identifier | token  | GET [base]/Coverage?identifier=***
| SHOULD           | patient | reference  | GET [base]/Coverage?beneficiary=Patient/***
| SHOULD           | payor | reference  | GET [base]/Coverage?payor=***
| SHOULD           | policy-holder | reference  | GET [base]/Coverage?policy-holder=***
| SHOULD           | status | token  | GET [base]/Coverage?status=***
| SHOULD           | subscriber | reference  | GET [base]/Coverage?subscriber=***
| SHOULD           | type | token  | GET [base]/Coverage?token=***



##### 2.1.1.2.5.2.1.1. 推奨検索パラメータ

<span style="color: red;">★★コメント： 説明は記載途中です★★</span>

次の検索パラメータをサポートすることが望ましい。

1. beneficiary 検索パラメータを使用して、識別子によるCoverageの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/Coverage?beneficiary={system|}[code]
   ```

   例：

   ```http
   GET [base]/Coverage?beneficiary=*****
   ```

   指定された識別子に一致するCoverageリソースを含むBundleを検索する。
   
2. class-type 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/Coverage.class?type={token}
   ```

   例：

   ```http
   GET [base]/Coverageclass?type=*****
   ```
