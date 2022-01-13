# 2.1.1.3. JP Core Encounter (来院/入院情報) プロファイル



## 2.1.1.3.1. 概略

医療サービスの提供または患者の健康状態の評価を目的とした、患者と医療提供者間の相互作用(interaction)。


| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Encounter |
| バージョン     | 1.0.0 |
| 名前           | JPCoreEncounterProfile                                   |
| タイトル       | JP Core Encounter Profile                               |
| ステータス     | アクティブ（2021-11-30）                                   |
| 定義           | このプロファイルはEncounterリソースに対して、来院/入院情報のデータを送受信するための基礎となる制約と拡張を定めたものである。                                                     |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpencounter   |



本プロファイルは、患者の医療機関受診に関する情報の登録や検索、取得のために 、FHIR Encounter リソースを使用するにあたっての、最低限の制約を記述したものである。Encounter リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。



### 2.1.1.3.1.1. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 患者番号・診察券番号による患者受診歴の検索

- 患者番号・診察券番号による入院履歴の検索

- 外来予約患者の来院状況の検索、一覧表示

- その他、上記以外の他のリソースからの患者受診歴の参照（例：Observationリソースの encounterで参照される対象とする患者の受診や、Careplanリソースのencounterで参照される患者の受診歴（入院歴））

#### 2.1.1.3.1.1.1. Scope and Usageの内容

範囲と使用方法

患者に関連したEncounterの情報はその利用される状況によって特徴づけられる。例えば、外来、救急、在宅医療、入院、およびオンライン受診の情報も含まれる。Encounterは入院前手続き、外来受診、入院、入院中の滞在、および退院などの一連のライフサイクルを含む。Encounterに含まれる、PratitionerやLocationといった情報は状況に応じて変更されていくことがある。

このようにEncounterの適用範囲は広範になるため、すべてのエレメントがすべての状況で利用されるとは限らない。このため、入院/退院に関連した情報は、Encounter内のhospitalizationエレメントに保持される。classエレメントはこれらの状況を区別するために使用され、これによりさらなる検証とビジネスルールの適用が導かれる。

また、どのビジネスイベントが新しいEncounterの開始につながるのか、あるいはEncounterにどのようなレベルの集計が使用されるのかについては、組織ごと（および管轄や国ごと）に大きな違いがある。例えば、入院中の外来診療/開業医への一回の来院は、それぞれ新しいEncounterのインスタンスにつながるかもしれないが、個別の運用や関係するシステムによっては、これが入院全体で一つのインスタンスに集約されることもあり得る。会計システムなどの財務的な理由またはその他の理由でEncounterのグループを導入する場合には、さらに多くの集約が行われる可能性がある。Encountersは、partOfエレメントを用いて他のEncountersの下に集約またはグループ化することができる。例については[こちらのリンク](http://hl7.org/fhir/encounter.html#examples)を参照すること。

Encounterインスタンスは、入院前情報を表現するために実際の外来や入院が行われる前に存在することがある。これには、予定された開始日または予定された場所を表現するためにEncounterを使用することも含まれる。この場合、status要素は「planned」に設定される。

Hospitalizationコンポーネントは、入院イベントに関連する拡張情報を格納するためのものである。これは常に、Encounter自体と同じ期間であることが期待される。期間が異なる場合は、別のEncounterのインスタンスを使用して、このEncounterのインスタンスの一部としてpartOfエレメントを使用してこの情報を取り込むべきである。

ProcedureとEncounterはお互いへの参照を持つが、これらは異なるProcedureであるべきである。1つは、Encounterの間に行われたProcedure（Procedure.encounterに格納）、もう1つは、Encounterが別のProcedureの結果である場合（Encounter.indicationに格納）、例えば、以前のProcedureによる合併症を解決するためのフォローアップのEncouterなどである。

#### 2.1.1.3.1.1.2. Status Managementの内容

ステータス管理

Encounterのライフサイクルでは、多くのステータス(status)を遷移する。一般的に、これらは組織のワークフローの順に、 planned(計画), in-progress(進行中), finished/cancelled(終了/キャンセル)となります。
このステータス情報はしばしば他のことに使用され、その際にはステータス履歴の分析が必要となることもある。これは、Encounterのすべてのhistoryを検索し、それぞれの期間をチェックし、何らかの形で後処理を行うことで可能となる。しかし、このような負担を軽減するために（またはシステムがリソース履歴をサポートしていない場合のために）、statusHistoryコンポーネントが用意されている。

そのEncounterが「来院した/入院した」ということを判断できる、statusの値は存在しない。Encounterの使用法およびジネスプラクティス/ポリシー/ワークフロー/タイプがこの定義に影響を与える可能性がある。(例：急性期医療施設、高齢者医療センター、外来診療所、救急部、地域に根ざした診療所など）
arrived, triaged または in-progress のstatusは入院の開始と考えられ、入力されたhospitalizationサブコンポーネントの存在を意味する。

on leave のstatusは、例えば、患者が週末に帰宅することを許可された場合や、その他の形式の外部イベントの場合など、入院の一部である場合もあれば、そうでない場合もある。
Encounterには「入院した」という固定した定義はないので、例えば外来（日帰り手術-大腸内視鏡検査）などの例では、患者は入院しているとも考えられる。少なくとも、ステータスが「in-progress」の場合は、患者は入院していると考えられます。

#### 2.1.1.3.1.1.3. Boudaries and Relationships の内容

境界線と関係性

Encounterリソースは予約情報を格納するために使用されるべきではなく、Appointmentリソースが予約情報のために使用されることが意図されている。多くのシステムでは、外来患者のEncounter（これはEncounterの範囲である）とAppointmentが同時に使用されていることに注意してほしい。FHIRでは、Appointmentはエンカウンターの日付を確定するために使用され、一方Encounterは実際の来院/入院等に関する情報、すなわち患者が現れることに適用される。
このように、「planned」のstatusのEncounterは、それを予定したAppointmentと同一ではないが、それは実際に発生する前のEncounterであり、Encounterが完了するまでに更新されることが期待される。患者の場所への到着は、必ずしもEncounterの開始を意味するものではない（例えば、患者が実際に施術者に診てもらうよりも1時間早く到着しても、Encounterの開始にはならない。）。

Appointmentは通常、Appointmentの計画段階、検索、空いている時間の場所の特定、そしてAppointmentの作成に使われる。このプロセスが完了し、Appointmentが開始されると、Appointmentは達成されたものとしてマークされ、新しく作成されたEncounterにリンクされる。
この新しいEncounterは、施設のある場所に入院したときに「arrived」状態で始まり、その後、病棟を移動した際には別のpartOfで関連付けられたEncounterが始まるかもしれない。

Communicationリソースは、直接の接触がない場合に、医療従事者と患者の間で同時に行われる対話に使用される。例としては、電話によるメッセージや、通信文書の送信などがある。通信資源には継続時間は記録されないが、送信時間と受信時間が含まれる可能性がある。

標準拡張。Associcated Encounter
この拡張機能は、リソース上にこの関連性を定義するプロパティが既に存在しない場合に、エンカウンターを参照するために使用されるべきである。

### 2.1.1.3.1.2. スコープ

外来における入院前受診、来院、入院診療における入院、滞在、退院といった、全ての患者受診を表す。

Encounterリソースは、class要素を用いて医療提供環境を特徴づけることができる。具体的な例としては以下の環境が想定されている。

- 救急
- 在宅診療
- 入院前
- 入院
- 検査通院
- 遠隔診療

Encounter リソースは発生単位が医療機関や組織ごとに異なる可能性がある。例えば、入院中に開業医が1回訪問するたびに新しいEncounterインスタンスが発生する可能性もあるし、地域の慣行や関連システムによっては、入院全体で1つのインスタンスに集約される場合もある。

Encounterリソースは、partOf要素を仕様して、他のEncounterインスタンスの下に集約することができる。

またEncounterリソースは、受診前の情報を伝達するために生成することもできる。この場合、status要素は「planned」に設定される。患者の受信内容が入院に関連する場合は、hospitalization要素に入院イベントに関連する拡張情報を格納することができる。
なおこの入院イベントの関連付けは、Encounterリソースのperiod要素で指定されている期間と同じ期間内であることが望ましい。もし期間が異なる場合は、別のEncounterインスタンスを使用し、このEncounterインスタンスの一部として情報を関連付ける必要がある。


## 2.1.1.3.2. 関連するプロファイル

Encounter リソースは、以下のリソースから直接参照される。

 - AdverseEvent
 - AllergyIntolerance
 - CarePlan
 - CareTeam
 - ChargeItem
 - Claim
 - ClinicalImpression
 - Communication
 - CommunicationRequest
 - Composition
 - Condition
 - Contract
 - DeviceRequest
 - DiagnosticReport
 - DocumentReference
 - Encounter
 - ExplanationOfBenefit
 - Flag
 - GuidanceResponse
 - ImagingStudy
 - Immunization
 - List
 - Media
 - MedicationAdministration
 - MedicationDispense
 - MedicationRequest
 - MedicationStatement
 - NutritionOrder
 - Observation
 - Procedure
 - QuestionnaireResponse
 - RequestGroup
 - RiskAssessment
 - ServiceRequest
 - Task
 - VisionPrescription


Encounter リソースは、以下のリソースを直接参照する。

 - Account
 - Appoiontment
 - Encounter
 - Location
 - Observation
 - Organization
 - Patient
 - ServiceRequest

## 2.1.1.3.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpencounter)


[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpencounter/$download?format=json)


{{tree:jp-core-draftv1/jpencounter,snapshot}}


### 2.1.1.3.3.1. 必須要素


次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

#### 2.1.1.3.3.1.1. 必須

Encounter リソースは、次の要素を持たなければならない。

- status ：受診状況を示す。value set encounter-statusで定義された値から設定する必要がある。（planned/arrived/triaged/in-progress/onleave/finished/cancelled/entered-in-error/unknown）
- class : 受診分類を示す。value set ActEncounterCodeで定義された値から設定する必要がある。（AMB/EMER/FLD/HH/IMP/ACUTE/NONAC/OBSENC/PRENC/SS/VR）

#### 2.1.1.3.3.1.2. Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### 2.1.1.3.3.2. Extensions定義


JP Encounter リソースで使用される拡張は次の通りである。

- [Associated Encounter](https://www.hl7.org/fhir/extension-encounter-associatedencounter.html)

  - リソースで関連付けを定義しているプロパティが存在しないEncounterを参照するために利用する

    

### 2.1.1.3.3.3. 用語定義




| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Encounter.status               | 現在の診療実施状況 | Required          | [EncounterStatus](https://www.hl7.org/fhir/valueset-encounter-status.html) |
| Encounter.statusHistory.status | 現在の診療実施状況 | Required          | [EncounterStatus](https://www.hl7.org/fhir/valueset-encounter-status.html) |
| Encounter.class | 診療実施分類 | Extensible          | [v3.ActEncounterCode](https://www.hl7.org/fhir/v3/ActEncounterCode/vs.html) |
| Encounter.classHistory.class | 過去の診療実施分類 | Extensible          | [v3.ActEncounterCode](https://www.hl7.org/fhir/v3/ActEncounterCode/vs.html) |
| Encounter.type | 診療の種別 | Example | [EncounterType](https://www.hl7.org/fhir/valueset-encounter-type.html) |
| Encounter.serviceType | 特定の診療の種別 | Example | [ServiceType](https://www.hl7.org/fhir/valueset-service-type.html) |
| Encounter.priority | 診療の優先順位 | Example | [v3.ActPriority](https://www.hl7.org/fhir/v3/ActPriority/vs.html) |
| Encounter.participant.type | 診療担当者の役割 | Extensible  | [ParticipantType](https://www.hl7.org/fhir/valueset-encounter-participant-type.html) |
| Encounter.reasonCode | 診療が行われる理由 | Preferred | [EncounterReasonCodes](https://www.hl7.org/fhir/valueset-encounter-reason.html) |
| Encounter.diagnosis.use | 診断の種類 | Preferred | [DiagnosisRole](https://www.hl7.org/fhir/valueset-diagnosis-role.html) |
| Encounter.hospitalization.admitSource | 入院した場所 | Preferred | [AdmitSource](https://www.hl7.org/fhir/valueset-encounter-admit-source.html) |
| Encounter.hospitalization.reAdmission | 再入院した理由 | Example | [v2.0092](https://www.hl7.org/fhir/v2/0092/index.html) |
| Encounter.hospitalization.dietPreference | 食事の事情 | Example |  [Diet](https://www.hl7.org/fhir/valueset-encounter-diet.html) |
| Encounter.hospitalization.specialCourtesy | 特別な作法 | Preferred |  [SpecialCourtesy](https://www.hl7.org/fhir/valueset-encounter-special-courtesy.html) |
| Encounter.hospitalization.specialArrangement | 特別待遇 | Preferred | [SpecialArrangements](https://www.hl7.org/fhir/valueset-encounter-special-arrangements.html) |
| Encounter.hospitalization.dischargeDisposition | 退院の判断 | Example | [DischargeDisposition](https://www.hl7.org/fhir/valueset-encounter-discharge-disposition.html) |
| Encounter.location.status | 場所の状態 | Required | [EncounterLocationStatus](https://www.hl7.org/fhir/valueset-encounter-location-status.html) |
| Encounter.location.physicalType | 実際の場所 | Example | [LocationType](https://www.hl7.org/fhir/valueset-location-physical-type.html) |



### 2.1.1.3.3.4. 制約一覧

このプロファイルでは制約定義は行っていない。


## 2.1.1.3.4. 利用方法

### 2.1.1.3.4.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### 2.1.1.3.4.2. OperationおよびSearch Parameter 一覧

#### 2.1.1.3.4.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/us-npi\|123456  |
| SHALL            | date, patient    | token  | GET [base]/Encounter?date=http://hl7.org/fhir/sid/us-npi\20210415?patient=http://hl7.org/fhir/sid/us-npi\|123456  |
| SHOULD           | identifier    | token  | GET [base]/Encounter?identifier=http://hl7.org/fhir/sid/us-npi\|123456 |
| SHOULD           | class, patient    | token  | GET [base]/Encounter?class=http://hl7.org/fhir/sid/us-npi\EMER?patient=http://hl7.org/fhir/sid/us-npi\|123456  |
| SHOULD           | patient, type    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/us-npi\|123456?type=http://hl7.org/fhir/sid/us-npi\ADMS  |
| SHOULD           | patient, status    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/us-npi\|123456?status=http://hl7.org/fhir/sid/us-npi\arrived  |

<span style="color: red;">★★コメント： この表に合致する形で以下の説明を記載していく必要があります。★★</span>

##### 2.1.1.3.4.2.1.1. 必須検索パラメータ

次の検索パラメータはでサポートされるべきである。(SHALL)

必須検索パラメータ(SHALL)はありません。

##### 2.1.1.3.4.2.1.2. 推奨検索パラメータ


次の検索パラメータをサポートすることが望ましい。(SHOULD)

1. identifier 検索パラメータを使用して、診察番号等の識別子によるEncounterの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Encounter?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Encounter?identifier=http://hl7.org/fhir/sid/us-npi|123456
   ```

   指定された識別子に一致するEncounterリソースを含むBundleを検索する。
   

##### 2.1.1.3.4.2.1.3. 追加検索パラメータ 

オプションとして次の検索パラメータをサポートすることができる。(MAY)

オプション検索パラメータ(MAY)はありません。

#### 2.1.1.3.4.2.2. Operation一覧


JP Encounter リソースに対して使用される操作は次の通りである。

- $everything：[base]/Encounter/[id]/$everything

  - この操作が呼び出された特定のEncounterに関連する全ての情報を返す。
    

#### 2.1.1.3.4.2.3. Operation 詳細

##### 2.1.1.3.4.2.3.1. $everything 操作

この操作は、この操作が呼び出された特定のEncounterリソースに関連する全ての情報を返す。
応答は "searchset" タイプのBundleリソースである。

この操作の公式なURLは以下である。

```
http://hl7.org/fhir/OperationDefinition/Encounter-everything
```

URL: [base]/Encounter/[id]/$everything

本操作は、べき等な操作である。


###### 2.1.1.3.4.2.3.1.1. 入力パラメータ
<!--
<span style="color: red;">http://www.hl7.org/fhir/encounter-operation-everything.html</span>
-->
| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |


###### 2.1.1.3.4.2.3.1.2. 出力パラメータ
<!--
<span style="color: red;">http://www.hl7.org/fhir/encounter-operation-everything.html</span>
-->
| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |




###### 2.1.1.3.4.2.3.1.3. 例

リクエスト：単一のEncounterに関連する全てのリソースを取得する。

```
GET [base]/Encounter/example/$everything
[some headers]
```

レスポンス：指定されたEncounterに関連する全てのリソースを返す。

```
HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "Bundle",
  "id": "p001",
  "meta": {
    "lastUpdated": "2020-01-06T15:11:11.447+00:00"
  },
  "type": "searchset",
  "entry": [
    {
      "fullUrl": "http://example.org/fhir/Encounter/p001",
      "resource": {
        "resourceType": "Encounter",

　　　　　・・・

　　　 },
    }
  ]
}  
```

### 2.1.1.3.4.3. サンプル


```JSON
{
  "resourceType": "Encounter",
  "id": "587293",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2020-01-06T15:11:11.447+00:00",
    "source": "#tK0UvlqmgxxHWOc2"
  },
  "status": "finished",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "AMB"
  },
  "type": [ {
    "coding": [ {
      "system": "http://snomed.info/sct",
      "code": "410620009",
      "display": "Well child visit (procedure)"
    } ],
    "text": "Well child visit (procedure)"
  } ],
  "subject": {
    "reference": "Patient/587224",
    "display": "Jonathan639 Kassulke119"
  },
  "participant": [ {
    "individual": {
      "reference": "Practitioner/587226",
      "display": "Dr. Shirely692 Berge125"
    }
  } ],
  "period": {
    "start": "2016-05-08T03:08:24+02:00",
    "end": "2016-05-08T03:23:24+02:00"
  },
  "serviceProvider": {
    "reference": "Organization/587225",
    "display": "PCP15810"
  }
}
```



## 2.1.1.3.5. 注意事項

Encounterリソースは、予定情報や予約の保存には使用されません。予約の保存にはAppointmentリソースを利用してください。FHIRでは、Appointmentは診察の日付を決定するのに利用されるのに対して、Encounterは実際に患者が来院して診察が実施されたことを表現します。
そのため、「計画済み」 status の Encounter は実際に発生する前の Encounter であり、診療行為が完了するまで更新されることが期待されます。


## 2.1.1.3.6. その他、参考文献・リンク等

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