# 2.1.4.3. JP Core Procedure （処置） プロファイル

## 2.1.4.3.1. 概略

本プロファイルは、患者に対する医療的な処置に関する情報の登録や検索、取得のために`Procedure`リソースを使用するにあたり、本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

| 項目 | 内容 |
| -------------- | ---------------------------------------------------------- |
| 定義URL | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure |
| バージョン | 1.0.0 |
| 名前 | JPCoreProcedureProfile |
| タイトル | JP Core Procedure Profile |
| ステータス | アクティブ （2021-11-24）  |
| 定義 | このプロファイルは`Procedure`リソースに対して、患者に対する医療的な処置のデータを送受信するための共通の制約と拡張を定めたものである。  |
| 公開者 | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpprocedure |

### 2.1.4.3.1.1. スコープ
対象とする処置は以下を想定する。

* 外科手術（歯科手術を含む）  
* 医科処置・歯科処置  
* 放射線治療  
* 精神療法  
* リハビリテーション  
* 各種指導管理  
* 看護実施

### 2.1.4.3.1.2. 想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

* 患者に実施された処置行為の検索
* 患者に行われた処置の記録または更新
* 他の記述仕様書からの参照  
  （例：退院時サマリ、診療情報提供書における、処置実施項目の参照）

`Procedure`リソースは、患者に対して実施されたもしくは実施が予定されていた処置の詳細を記録するために使用される。処置とは、ケアの一環として、患者に対して、患者とともに、または患者のために行われる活動のことである。例えば、外科的処置、診断処置、内視鏡的処置、生検、カウンセリング、理学療法、パーソナルサポートサービス、成人のデイケアサービス、緊急ではない交通手段、住宅改修、運動などがある。手続きは、医療従事者、サービス提供者、友人や親戚、場合によっては患者自身が行うこともある。

`Procedure`リソースは、処置の発生に関する要約情報を提供するものであり、処置行為が進行する際のリアルタイムのスナップショットを提供することを意図したものではないが、心理療法のような長期にわたる治療の場合は、全体的な進捗状況に関する要約レベルの情報を表すことができる。詳細なリアルタイムの処置情報をサポートするリソースの作成は、そのような情報を共有するための具体的な実装のユースケースの特定後に行うことになる。

## 2.1.4.3.2. 関連するプロファイル
本プロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- `AdverseEvent`
- `Appointment`
- `ChargeItem`
- `Claim`
- `DeviceUseStatement`
- `Encounter`
- `ExplanationOfBenefit`
- `Flag`
- `ImagingStudy`
- `MedicationAdministration`
- `MedicationDispense`
- `MedicationStatement`
- `Observation`
- `Procedure`
- `QuestionnaireResponse`

## 2.1.4.3.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpprocedure)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpprocedure/$download?format=json)


{{render:jp-core-draftv1/jpprocedure}}

### 2.1.4.3.3.1. 必須要素 
本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- `status` : 処置のステータス。
- `code` : 処置の種類を示すコード。
- `subject` : 処置の実施対象となる患者。
- `performed` : 処置が実施もしくは実施が予定されていた、推定または実際の日付、日時、期間、または年齢。

### 2.1.4.3.3.2. Extensions定義

- Extensions定義はない

### 2.1.4.3.3.3. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `Procedure.status` |本処置の状態 | Required          | [EventStatus](http://www.hl7.org/fhir/ValueSet/event-status) |
| `Procedure.statusReason`| 本処置が行われなかった場合、その理由を表すコード。 | Example        | http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
| `Procedure.category` | 本処置のカテゴリ | Example  | http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
| `Procedure.code`| 本処置のコード | Required          | [ProcedureCodes](http://www.hl7.org/fhir/valueset/jp-core-procedure-code) |
| `Procedure.performer.function` | 本処置を行う医療者の職種| Example | http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
| `Procedure.reasonCode` | 本処置が行われた理由　| Example| 未定　|
| `Procedure.bodySite` | 本処置が行われた部位　| Example | http://jpfhir.jp/fhir/CodeSystem/*** (予定) 　|
| `Procedure.outcome` | 本処置によるアウトカム 　| Example | http://hl7.org/fhir/ValueSet/procedure-outcome |
| `Procedure.complication` | 本処置により生じた合併症 |未定 | 未定　 |
| `Procedure.followUp` | 本処置の後に行われる処置 |未定 | 未定　 |
| `PProcedure.focalDevice.action` | 本処置の最中にデバイスに生じた変更 |未定 | 未定　 |
| `Procedure.usedCode` | 本処置に使われたデバイス |未定 | 未定　 |

## 2.1.4.3.4. 利用方法

### 2.1.4.3.4.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）   | search-type, read                           |
| SHOULD（推奨）  | vread, history-instance                     |
| MAY（利用可能） | create, update, patch, delete、history-type |

### 2.1.4.3.4.2. OperationおよびSearch Parameter 一覧


#### 2.1.4.3.4.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | reference  | GET [base]/Procedure?patient=123456 |
| SHALL            | patient,date          | reference,date | GET [base]/Procedure?patient=123456&date=ge2021-08-24 |


##### 2.1.4.3.4.2.1.1. 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータ`patient`で指定される患者が有する全ての`Procedure`の検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/Procedure?patient={Type/}[id]
   ```

   例：

   ```http
   GET [base]/Procedure?patient=123456
   ```

   指定された患者のすべての`Procedure`リソースを含むBundleを検索する。

2. 検索パラメータ`patient`と`date`の両者で指定される`Procedure`の検索をサポートしなければならない（SHALL）。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    ```http
    GET [base]/Procedure?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    ```

    例：

    ```http
    GET [base]/Procedure?patinet=123456&date=ge2021-08-24
    ```

    指定された患者および日付のすべての`Procedure`を含むBundleを検索する。


##### 2.1.4.3.4.2.1.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが推奨(SHOULD)される。

1. 検索パラメータ`patient`と`status`パラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば status={system|}[code],{system|}[code],...)

    ```http
    GET [base]/Procedure?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/Procedure?patient=123456&status=completed
    ```

    指定された患者およびステータスのすべての`Procedure`を含むBundleを検索する。

2. 検索パラメータ`patient`と`code`と`date`パラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のオプションのサポートを含む (例えば code={system|}[code],{system|}[code],...)
  * dateに対する次の比較演算子のサポートを含む:gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えばdate=[date]&date=[date]]&...)
    ```http
    GET [base]/Procedure?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    ```

    例：

    ```http
    GET [base]/Procedure?patient=123456&date=ge2019-01-14T00:00:00Z&code=http://jpfhir.jp/fhir/CodeSystem/Procedure|123456
    ```

    指定された患者および日付およびプロシージャコードのすべての`Procedure`を含むBundleを検索する。複数のコードによる検索をサポートしなければならない。

##### 2.1.4.3.4.2.1.3. オプション検索パラメータ 

- オプション検索パラメータはない

#### 2.1.4.3.4.2.2. Operation一覧

- Operation一覧はない

### 2.1.4.3.4.3. サンプル

```JSON
{
  "resourceType" : "Procedure",
  "id" : "example",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns="http://www.w3.org/1999/xhtml">xxx</div>"
  },
  "status" : "completed",
  "code" : {
    "coding" : [
      {
        "system" : "http://jpfhir.jp/fhir/CodeSystem/procedurecategory",
        "code" : "srg",
        "display" : "手術処置"
      },
      {
        "system" : "http://jpfhir.jp/fhir/CodeSystem/Procedure",
        "code" : "1234567",
        "display" : "・・・"
      }
    ],
    "text" : "・・・"
  },
  "subject" : {
    "reference" : "Patient/example",
    "display" : "・・・・"
  },
  "performedDateTime" : "2021-08-24"
}
```

## 2.1.4.3.5. 注意事項

- 未定

## 2.1.4.3.6. その他、参考文献・リンク等

- 未定








