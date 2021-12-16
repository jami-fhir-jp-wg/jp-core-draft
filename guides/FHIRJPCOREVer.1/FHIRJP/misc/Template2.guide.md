# テンプレートプロフィール
このドキュメントはHL7 FHIR実装ワーキンググループで作業中の実装ガイドです。

(必要に応じて、章・項目を追加・削除してください）　

## 概略

<span style="color: red;">★★コメント ： US-Coreの記載に準じて、定義URL、バージョン、名前、タイトル、ステータス、定義、公開者、コピーライトの記述を追加しました。★★</span>



| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://hl7fhir.jp/fhir/core/StructureDefinition/JP_Practitioner |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCorePratitionerProfile                                   |
| タイトル       | JP Core Practitioner Profile                               |
| ステータス     | アクティブ（yyyy-mm-dd）                                   |
| 定義           | （次の例の参考に、\[]内をプロファイルにあわせて変更して記載する。\[]外も必要に合わせて適宜修正してください）<br>（例1）このプロファイルは\[Patient\]リソースに対して、\[患者\]のデータを送受信するための基礎となる制約と拡張を定めたものである。<br>（例2）このプロファイルは\[ImagingStudy\]リソースに対して、\[ひとつの画像検査\]のデータを送受信するための基礎となる制約と拡張を定めたものである。\[必要なら説明を追記。\]<br>（例3）このプロファイルは、\[他のJP Core プロファイル(具体名でも可)\]から参照される。\[Medication\]リソースに対して、\[注射処方におけるRP\]のデータを送受信するための基礎となる制約と拡張を定めたものである。<br>（例4）このプロファイルは\[Observation\]リソースに対して、\[臨床所見や検査結果\]のデータを送受信するための\[共通の\]制約と拡張を定めたものであり、個別のプロファイルと共に使用される。<br>（例4）このプロファイルは\[Observation\]リソースに対して、\[検体検査結\果]のデータを送受信するための制約と拡張を定めたものであり、Observation（共通）プロファイルと共に使用される。　　　　　|
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| ソースリソース | StructureDefinitionリソースへのリンク（XML/JSON/Turtle）   |


(プロファイル定義全般の概略記載します)

本プロファイルは、医療従事者に関する情報の登録や検索、取得のために 、FHIR Practitioner リソースを使用するにあたっての、最低限の制約を記述したものである。Practitioner リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

###  背景および想定シナリオ
(想定しているユースケースを記述します)

本プロファイルは、以下のようなユースケースを想定している。

- 氏名または医籍登録番号による医療従事者の検索

- 他のリソースからの医療従事者情報の参照（例：Patientリソースの generalPractitionerで参照される患者の主治医や、Encounterリソースのparticipantで参照される診察の担当医）

###  スコープ
(対象としているスコープ／対象としないスコープについて記載します)

医療（ヘルスケア）の提供、及び、ヘルスケア関連サービスに、直接的、または、間接的に係わる全ての人を表す。本リソースに含まれる医療従事者の例を示す（ただし、この一覧に限定されない）。

- 医師、歯科医師、薬剤師
- 看護師、保健師、医療クラーク
- 助産師、栄養士、心理士
- 臨床検査技師、放射線技師
- 臨床工学技士、義肢装具士
- 医療事務者（受付担当者）

元となるPatientリソース同様に、本プロファイルは友人や親戚、隣人のケアをする個人のように、正式な責任を持たずに医療に関与する個人を表現するために使用してはならない。それらの情報は、患者の関係者として RelatedPerson リソースを使用して表現されるべきである。

Practitioner リソースは、ヘルスケアサービスの提供組織を代表し、複数の患者のために行動する個人に対して使用される。一方で、RelatedPerson リソースは、特定の組織に関連づけられておらず、特定の患者に関係する個人を表現するために使用される。

PractitionerRole リソースは、医療従事者が、特定の組織において与えられている役割の詳細を表す。特定の施設に関係しない資格や識別子（例：医籍番号や麻薬施用者免許証番号）は、Practitioner リソースに記録することが望ましい。一方で、特定の施設における医療従事者の識別子や役割（例：特定の医療機関における医療従事者ID）は、施設を表すOrganizationリソースとあわせて PractitionerRole リソースに記録することが望ましい。

## 関連するプロファイル
(関連とするプロファイルのリンクを記載します）

<span style="color: red;">★★コメント ： 各JP リソースの参照個所に、JP版リソースが追加されることを前提としています。★★</span>

JP Practitioner プロファイルは、以下のプロファイルから直接参照される。

- JP Core Patientプロファイル
- JP Core Encounterプロファイル
- JP Core PractitionerRoleプロファイル
- JP Core MedicationRequestプロファイル
- JP Core MedicationDispenseプロファイル
- JP Core MedicationAdministrationプロファイル
- JP Core Observationプロファイル
- JP Core ImagingStudyプロファイル
- JP Core DiagnosticReportプロファイル
- JP Core AllergyIntoleranceプロファイル
- JP Core Conditioプロファイル
- JP Core Procedureプロファイル

## プロファイル定義
(プロファイルの定義について説明を行います。下の例はPatientプロファイル)
{{tree:FHIRJPIGWG/jppatient}}

### 必須要素
(必須要素についての説明を行います）

<span style="color: red;">★★コメント ： 現状のJP Practitioner プロファイルの定義には、必須要素もMust Supportも定義されていないため、例示として示します。★★</span>

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

Practitioner リソースは、次の要素を持たなければならない。
- name ：医療従事者の氏名は必須であり、name.text が必ず存在しなければならない。

Practitionerリソースは、次の要素をサポートしなければならない。
- identifier： 医籍登録番号が利用可能な場合、サポートされなければならない。

### Extensions定義
(拡張を行った場合、ここに説明を記載します）

<span style="color: red;">★★コメント ： JP Core Practitionerプロファイルで定義された拡張はないため例示します。拡張定義の詳細は、別ドキュメントに記述される想定です。★★</span>

JP Practitioner プロファイルで使用される拡張は次の通りである。

- animalSpecies

  - 動物をつかったヘルスケアサービスの提供を行う場合（例：がん探知犬）、動物の種を表す。


### 用語定義
(利用するコード体系や追加した用語集などを記載)

<span style="color: red;">★★コメント ： 利用するコード体系や追加した用語集など。現状の定義では、基底のPractitionerで定義されている用語に加えて追加されているものはないため、例示します。★★</span>


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Practitioner.qualification.code | 医療従事者が保有する資格（hcRole） | Preferred          | HealthcareRole |



## 利用方法
（OperationやSearch Parameter中心に記載を行います。）


### Interaction一覧
| Conformance | Interactions |
| ---- | ---- | 
| SHALL | search-type, read |
| SHOULD | vread, history-instance |
| MAY | create, update, patch, delete, history-type |




##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、医籍登録番号などの識別子によるPractitionerの検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/Practitioner?identifier={system|}[code]
   ```

   例：

   ```http
   GET [base]/Practitioner?identifier=http://hl7.org/fhir/sid/us-npi|123456
   ```

   指定された識別子に一致するPractitionerリソースを含むBundleを検索する。

   

2. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/Practitioner?name=[string]
   ```

   例：

   ```http
   GET [base]/Practitioner?name=山田
   ```

   名前（姓、名、またはテキスト）が一致するPractitionerリソースを含むBundleを検索する。

   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. communication 検索パラメータを使用して、医療従事者が使用する言語コードによるPractitionerの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/Practitioner?communication={system|}[code]
   ```

   例：

   ```http
   GET [base]/Practitioner?communication=urn:ietf:bcp:47|jp
   ```

   使用言語が指定された言語コードと一致するPractitionerリソースを含むBundleを検索する。



##### 追加検索パラメータ 

<span style="color: red;">★★コメント： US-Coreでは 基底以外の追加検索パラメータ（基底プロパティまたは拡張(Extension)に対する検索パラメータの両方を含む）についての記載がありませんが、必要と思われたので追加しました。内容は例示です。★★</span>



1. qualification-identifier検索パラメータを使用して、資格識別子によるPractitionerの検索をサポートしなければならない（SHALL）。

   ```HTTP
   GET [base]/Practitioner?qualification-identifier={system|}{value}
   ```

   例：

   ```HTTP
   GET [base]/Practitioner?qualification-identifier=http://example.org/UniversityIdentifier|12345
   ```

   指定された識別子と資格識別子が一致するPractitionerリソースを含むBundleを検索する。

   

2. jp-core-ethnicity検索パラメータを使用して、民族性によるPractitionerの検索をサポートすることが望ましい（SHOULD）。

   ```HTTP
   GET [base]/Practitioner?jp-core-ethnicity={system|}{code}
   ```

   例：

   ```http
   GET [base]/Practitioner/?jp-core-ethnicity=http:example.org/ethnicity|abc
   ```

   指定された民族コードと民族性が一致するPractitionerリソースを含むBundleを検索する。



#### Operation一覧



<span style="color: red;">★★コメント： Practitionerに対するOperationは定義されていないため、例示します。内容の妥当性は考慮していません。★★</span>



JP Practitioner プロファイルに対して使用される操作は次の通りである。

- $everything：[base]/Practitioner/[id]/$everything

  - この操作が呼び出された特定のPractitionerに関連する全ての情報を返す。

    

#### Operation 詳細



<span style="color: red;">★★コメント：内容は、例示であり、妥当性は考慮していません。★★</span>



#####  $everything 操作

この操作は、この操作が呼び出された特定のPractitionerリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別された医療従事者のPractitionerコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```http
http://hl7.jp/fhir/OperationDefinition/Practitioner-everything
```

URL: [base]/Practitioner/[id]/$everything

本操作は、べき等な操作である。



###### 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |



###### 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |



###### 例

リクエスト：単一のPractitionerに関連する全てのリソースを取得する。

```http
GET [base]/Practitioner/p001/$everything
[some headers]
```

レスポンス：指定されたPractitionerに関連する全てのリソースを返す。

```http
HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "Bundle",
  "id": "example",
  "meta": {
    "lastUpdated": "2014-08-18T01:43:33Z"
  },
  "type": "searchset",
  "entry": [
    {
      "fullUrl": "http://example.org/fhir/Practitioner/p001",
      "resource": {
        "resourceType": "Practitioner",

　　　　　・・・

　　　 },
    }
  ]
}  
```



### サンプル

<span style="color: red;">★★コメント：例示します。★★</span>




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

### サンプル
[JSONサンプル](templatejsonsample)
[その２](https://simplifier.net/packages/simplifier.core.r4.resources/4.0.0/files/18949/~json)

## 注意事項
(全体に対する注意事項等、その他の部分について記載します。）

医療従事者の資格は、組織や役割に関係なく医療従事者によって取得されたものであり、特定の組織（Organization）または場所（Location）で、資格に関連する役割を実行することが許可または認可されていることを意味するものではないことに注意する。


## その他、参考文献・リンク等


