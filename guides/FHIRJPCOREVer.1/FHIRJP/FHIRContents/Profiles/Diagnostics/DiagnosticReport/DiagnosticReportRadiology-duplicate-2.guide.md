# 2.1.3.3.2. JP Core DiagnosticReport Radiology (放射線検査レポート) プロファイル

## 2.1.3.3.2.1. 概略

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Radiology |
| バージョン     | 1.0.0                                                      |
| 名前           | JPDiagnosticReportRadiology                                |
| タイトル       | JP Core Diagnostic Report Radiology Profile                |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | このプロファイルは[`DiagnosticReport`](DiagnosticReport#Common2)リソースに関し放射線検査の１項目を対象として表現し、データを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpdiagnosticreportradiology |



本プロファイルは、[`DiagnosticReport`リソース](DiagnosticReport#Common2) のうち、放射線画像検査における患者、患者群、機器、場所、およびこれらから得られた画像に対して実施された診断結果またはその解釈を示す「報告書」を表現するリソースの定義である。ここでは、`DiagnosticReport` リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。
報告書は、依頼者や撮影の情報などの臨床的背景のほか、いくつかの計測値、画像、テキストおよびコード化された解釈、テンプレート化された診断報告書により構成される。

## 2.1.3.3.2.2. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- 施設内で発生するオーダをもとに実施される画像検査に対する診断レポートの保存
- 他のリソースからの放射線検査レポートの参照<br>
（例：[`ImagingStudy`リソース](https://simplifier.net/jp-core-draftv1/jpimagingstudy) や[`ServiceRequest`リソース](http://www.hl7.org/fhir/servicerequest.html) の`reasonReference` エレメントで参照される放射線検査レポート）

### 2.1.3.3.2.2.1. スコープ

放射線検査レポートで取り扱う診断報告書は、検査の終了後に、検査の診断結果として提供される一連の情報である。
この情報には、テキストレポート、画像、コード、および計測値などが含まれる。この組み合わせは、診断手順や特定の検査の結果の性質に応じて変化する。FHIRでは、レポートはドキュメント、RESTful API、メッセージングフレームワークなど、さまざまな方法で伝達することができる。これらの方法に含まれるのは、`DiagnosticReport`リソースそのものである。

`DiagnosticReport`リソースは、診断レポート自体の他に、患者など対象者に関する情報を持つ。また、オーダーに関する情報や所見の詳細、画像を参照することもできる。レポートの結論は、テキスト、構造化されたコード化データ、またはPDFなどの完全に標準化された添付レポートとして表現することができる。

もっとも典型的にはレポートの診断結果を`DiagnosticReport.conclusion`エレメントに保持し`DiagnosticReport.presentedForm`エレメントでレポート全体のデータを持つ。また、キー画像等の添付データは`DiagnosticReport.media`エレメントに`Media`リソースへのリンクとして保持する。

レポート全体のデータは、レポーティングシステム等により作成された多彩な表現型（PDF, RichText, xhtml等）でBase64のAttachmentとして提供される。ただし、結果参照や検索の汎用性を担保しHuman readableな形で提供されることを目的とし、レポートの内容はDomainResourceであるDiagnosticReport.textエレメントにも格納される。

`DiagnosticReport`リソースは、過去の結果（リソース内での過去および現在の結果）の提示をサポートすることを意図していない。`DiagnosticReport`リソースは、シーケンスの構造化を含めレポートの完全なサポートをまだ提供できていないが、将来実装される予定である。

## 2.1.3.3.2.3. 関連するプロファイル

このプロファイルは、以下のリソースに対して定義された各プロファイルから参照される。

- [`DiagnosticReport`](https://simplifier.net/jp-core-draftv1/jpdiagnosticreportradiology)
- [`ImagingStudy`](https://simplifier.net/jp-core-draftv1/jpimagingstudy)

また，このプロファイルから直接参照されるリソースは以下の通りである。

- [`Patient`](Patient)
- [`Encounter`](http://www.hl7.org/fhir/encounter.html)
- [`Practitioner`](Practitioner)
- [`Observation`](Observation)
- [`Media`](http://www.hl7.org/fhir/media.html)
- [`ImagingStudy`](jpimagingstudy)
- [`ServiceRequest`](http://hl7.org/fhir/servicerequest.html)


また，以下のリソースは関連情報として`presentedForm`にて参照されるレポート内に保持される可能性がある。ただし、レポートシステムの仕様に依存するため、レポートシステムでは各リソースとの相互運用性の確保に配慮することが求められる。

- [患者 (`Patient`)](Patient)
- [依頼医，読影医，確定医など (`Practitioner`)](Practitioner)
- [身長 (`Observation`)](https://simplifier.net/jp-core-draftv1/jpobservationbodymeasurement)
- [体重 (`Observation`)](https://simplifier.net/jp-core-draftv1/jpobservationbodymeasurement.html)
- [アレルギー情報 (`AllergyIntorelance`)](https://simplifier.net/jp-core-draftv1/jpallergyintolerancev400)
- [キー画像 (`media`)](http://www.hl7.org/fhir/media.html)
- [尿素窒素（BUN）(`Observation`)](https://simplifier.net/jp-core-draftv1/jpobservationlabresult)
- [クレアチニン（Cre）(`Observation`)](https://simplifier.net/jp-core-draftv1/jpobservationlabresult)
- 感染症情報 [ (`RiskAssessment`) ](http://hl7.org/fhir/riskassessment.html) あるいは [ (`Observation`) ](https://simplifier.net/jp-core-draftv1/jpobservationlabresult)

運用のフローに関連する TASK、Procedure 等のリソース定義についてはここでは触れない。

## 2.1.3.3.2.4. リソース定義
- [リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/JPDiagnosticReportRadiology)
- [リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/JPDiagnosticReportRadiology/$download?format=json)


{{tree:jp-core-draftv1/jpdiagnosticreportradiology}}

Narrativeなレポート内容はDomainResourceであるtextに保管される。

Textのリソース構造およびコーティングは[以下](diagnosticreportradiology2#text)を参照のこと。

### 2.1.3.3.2.4.1. 必須要素

次のデータ項目は必須（SHALL）である。

- `status` ：レポートの状態・進捗状況
- `category` ： “RAD”をデフォルトとし、特に検査種別を含む部門指定を指定したい場合は"RUS", "RX", "CT", "NMR", "NMS", "VUS", "OUS", "CUS"などを指定する．
- `code` ：レポートの種別（画像診断レポート交換手順ガイドライン「5.1 レポート種別コード」に記載されているLOINCコード "Diagnostic imaging study" を指定）
- `effectiveDateTime` ： レポート作成日時

### 2.1.3.3.2.4.2. MustSupport

次のデータは送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

- `text` : (DiagnosticReport [`DomainResource`](https://simplifier.net/simplifier.core.r4.resources/domainresource)) レポートの[narrative](http://www.hl7.org/fhir/narrative.html) dataとして格納する。
- `basedOn` ： レポートあるいは画像検査の`ServiceRequest`
- `subject` ： 患者リソース(`Patient`)への参照。殆どの場合存在するが、緊急検査等で患者リソースが確定していない場合が想定される
- `issued` ： レポート確定日時
- `performer` ： `Practitioner`でレポートの関係者（作成者、読影者、確定者など）を列挙
- `resultInterpreter` ： `Practitioner`でレポート確定者を示す
- `imagingStudy` ： 診断の対象となる画像
- `link` ：キーイメージの参照先
- `conclusion` ： 診断の結果、impression
- `presentedForm` ：レポート本体（全体のイメージあるいは所見等のテキスト）

`imagingStudy`エレメントはCardinalityが0..1だが、放射線レポートでは画像が必ず存在することから、検査実施後には必須（複数の可能性もあり）である。しかし、検査実施前などのstatusによっては0もあることから、とりあえずMustSupportのままとする。将来的な議論の結果によっては、cardinalityを変更する可能性がある。

### 2.1.3.3.2.4.3. Extensions定義

本プロファイルはextensionを定義しない。


### 2.1.3.3.2.4.4. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `DiagnosticReport.status` | レポートのステータス | Required | [`DiagnosticReportStatus`](http://hl7.org/fhir/valueset-diagnostic-report-status.html) |
| `DiagnosticReport.category` | レポート（所見）を作成した部門 | Preferred | [`DiagnosticServiceSectionCodes`](http://hl7.org/fhir/ValueSet/diagnostic-service-sections)<br>"RAD", "RX", "CT", "NMR", "NMS", "RUS", "VUS", "OUS", "CUS"などを指定。デフォルトは"RAD"。 |
| `DiagnosticReport.code` | レポートのフォーマット、種類など | Preferred | [Diagnostic imaging study](https://loinc.org/18748-4/) |
| `DiagnosticReport.conclusionCode` | 診断レポートの結論・要約 | Example | [ICD-10](https://icd.who.int/browse10/2019/en), [ICD-11](https://icd.who.int/browse11/l-m/en) |

## 2.1.3.3.2.5. 注意

### 2.1.3.3.2.5.1. Text

`DiagnosticReport`のドメインリソースの一つである`text`エレメントに見読可能な[narrative](http://www.hl7.org/fhir/narrative.html)データとしてレポートの所見を中心とした情報を格納する。依頼情報や患者基本情報などを含んだレポート全体のデータは別途`presentedForm`エレメントに保持されるが、ここではPDF等のバイナリが保存される。よってレポート内容の見読性と検索性を担保するために`text`エレメントに保存されたデータが利用される。

NarrativeなtextにアクセスするためのDomainResource定義

(`DiagnosticReport`のResourceType直下に現れる。text以外のDomainResourceの詳細については[こちら](https://www.hl7.org/fhir/domainresource.html)を参照のこと）

{{tree:simplifier.core.r4.resources/domainresource}}

例：
```json
{
  "resourceType": "DiagnosticReport",
  "id": "xxxxxxxxxx",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2020-10-25T17:00:03.903+00:00",
    "source": "xxxxxxxxxxxxxx"
  },
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>胸部造影CT</p><p>依頼目的:10月20日の単純写真でひだり肺に異常陰影あり。精査目的。</p><p>所見:</p><p>心拡大は無く、心嚢液も見られない。</p><p>胸部大動脈は蛇行があるも径は正常範囲内。ひだり椎骨動脈が大動脈弓より直接分岐している。大動脈壁に小さな石灰化がみられ動脈硬化性変化が軽度見られる。</p><p>ひだり肺上葉に2.2 x 1.5 cm大の空洞性病変を認める(Image 31/110)。壁には充実性成分を含み不整な造影濃度を示す。みぎ肺上葉に気管支拡張を伴う線状影を認めるが、こちらは炎症性瘢痕として矛盾しない。気管には異常を認めず。肺尖部に炎症後変化と思われる胸膜肥厚は見られる。胸水は認めない。</p><p>腋窩，縦郭および肺門リンパ節の腫大は認めず。甲状腺は正常範囲。</p><p>スキャン範囲内の腹部には異常を認めず。明らかな骨病変も認めない。</p><p>インプレッション:</p><ol><li><p>ひだり肺上葉の空洞性病変。肺腺癌を疑う。</p></li><li><p>みぎ肺上葉陳旧性炎症性瘢痕。<p></li></ol></div>"
  },
  "identifier": [ {
    "use": "usual",
    "system": "http://www.acme.com/identifiers/patient",
    "value": "xxxxxxxxxxxxxxx"
  } ],
  "status": "final",
  "category": [ {
    "coding": [ {
      "system": "http://hl7.org/fhir/v2/0074",
      "code": "RAD"
    } ]
  } ], 
  "subject": {
    "reference": "Patient/pat2"
  },
  "effectiveDateTime": "2008-06-17",
  "issued": "2008-06-18T09:23:00+10:00",
  "performer": [
    {
      "reference": "Practitioner/3ad0687e-f477-468c-afd5-fcc2bf897809",
      "display": "田中太郎"
    }
  ],
  "imagingStudy": [
    {
      "display": "CHEST CT DICOM imaging study",
      "reference": "http://someserver/some-path"
  ],
　"conclusion": "インプレッション: ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。",
  "presentedForm": [{
    "contentType": "application/jpg",
    "language": "ja", 
    "data":"/9j/4AAQSkZJRgABAgAAZAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxwrh/9X/xP/Z9tYV8PiQ//2Q==",
    "title": "HTML Report"
  }]
}
```


### 2.1.3.3.2.5.2. Identifier

`Identifier` のデータタイプはオーダー依頼者であるPlacerあるいはオーダーの実施者であるFiller（HL7 Version 2 Messaging Standardにて'Placer'あるいは'Filler'として知られている）によって割り当てられた識別子を区別するために利用される`type`エレメントを持っている。`type`エレメントは以下の様に利用する。
<br>

#### 2.1.3.3.2.5.2.1. Placerの場合
```json
{
  "identifier":[{
    "type":{
      "coding":{
        "system":"http://terminology.hl7.org/CodeSystem/v2-0203",
        "code":"PLAC"
      },
      "value":"Placer"
    },
    "system":"urn:oid:1.2.3.4.5.6.7",
    "value":"2345234234234"
  }]
}
```
#### 2.1.3.3.2.5.2.2. Fillerの場合
```json
{
  "identifier":[{
    "type":{
      "coding":{
        "system":"http://terminology.hl7.org/CodeSystem/v2-0203",
        "code":"FILL"
      },
      "value":"Filler"
    },
    "system":"http://terminology.hl7.org/CodeSystem/v2-0203",
    "value":"567890"
  }]
}
```

`DiagnosticReport_Radiology` リソースでは`type`エレメントを明示する際にはオーダ番号やレポート番号が格納される可能性がある点に留意して対応することが重要である。

### 2.1.3.3.2.5.3. 時間の指定

このプロファイルのリソースでは、`effective[x]`エレメントにはレポート作成時間を[dateTime](http://www.hl7.org/fhir/datatypes.html#dateTime)で格納する。

### 2.1.3.3.2.5.4. 関連するObservation

`DiagnosticReport.result`エレメントには関連する検体検査計測値などをしめす`Observation`リソースを含むことができる。

### 2.1.3.3.2.5.5. 参照画像

`ImagingStudy`や`media`は多少オーバーラップするが、使用される目的が異なる。用途に応じて使い分けること。`DiagnosticReport`ではDICOM画像への参照として`ImagingStudy`が利用され、キー画像として`media`が参照される。

### 2.1.3.3.2.5.6. レポートの内容

典型的には放射線レポートはnarrativeな構成でのレポートが作成される。`DiagnosticReport_Radiology`では標準的なnarrativeリソースの表現としてXHTMLやrich text表現として（典型的にはPDF）が`presentedForm`に指定される。

Conclusionやコード化された診断結果は各々がレポートを構成する小さなデータであるが、これらは`presentedForm`に保持されるnarrativeなデータ内に含まれると同時に、本リソースのエレメントに複製されなければならない（SHOULD)。

診断レポートの所見などnarrativeなデータは`DiagnosticReport`のドメインリソースとして定義されている`text`にも保持すること。`presentedForm`との内容の重複は許容されている。`presentedForm`はbase64のバイナリであるため、`DiagnosticReport`の`text`が検索性の担保に利用される．また、見読性も同時に保たれる。

診断レポートの分野はAIによる診断補助やレポートの構造化を含め様々な変革がもたらされている。そのため、上記仕様は現時点でのリソース展開の例示であり、将来的に変更される可能性がある。

## 2.1.3.3.2.6. 利用方法

### 2.1.3.3.2.6.1. Interaction一覧 
`DiagnosticReport` リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[DiagnosticReport共通情報プロファイル#インタラクション一覧](DiagnosticReport#DxReportInteraction)

#### 2.1.3.3.2.6.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

| Name | Type | Description | Expression |
| --- | --- | --- | --- |
| `based-on` | `reference` | オーダ情報への参照 | `DiagnosticReport.basedOn`<br><br> ([`ServiceRequest`](http://hl7.org/fhir/servicerequest.html)) |
| `category` | `token` | レポート種別 | `DiagnosticReport.category` ([ValueSet](http://hl7.org/fhir/valueset-diagnostic-service-sections.html)) <br> "RAD", "RX", "CT", "NMR", "NMS", "RUS", etc.<br> default = “RAD” |
| `code` | `token` | レポート全体を示すコード | `DiagnosticReport.code`<br>[LOINC 18748-4](https://loinc.org/18748-4/)|
| `conclusion` | `token` | コード化されたレポートの conclusion (interpretation/impression) | `DiagnosticReport.conclusionCode` | 
| `date` | `date` | レポート作成日 | `DiagnosticReport.effectiveDate` |
| `encounter` | `reference` | オーダが発行された際の Encounter | `DiagnosticReport.encounter`<br><br> ([`Encounter`](http://www.hl7.org/fhir/encounter.html)) |
| `identifier` | `token` | レポートの identifier（識別子） | `DiagnosticReport.identifier` | 
| `issued` | `date` | レポート発行日（確定日） | `DiagnosticReport.issued` |
| `media` | `reference` | キー画像への参照 | `DiagnosticReport.media.link`<br><br> ([`Media`](http://www.hl7.org/fhir/media.html)) | 
| `performer` | `reference` | レポート確定者 | `DiagnosticReport.performer`<br><br> ([`Practitioner`](Practitioner)) |
| `result` | `reference` | 関連する検査結果 (検体検査結果など) | `DiagnosticReport.result`<br><br> ([`Observation`](jpobservationlabresult))|
| `results-interpreter` | `reference` | 読影者 | `DiagnosticReport.resultsInterpreter`<br><br> ([`Practitioner`](Practitioner)) |
| `status` | `token` | レポートの状態 | `DiagnosticReport.status` |
| `subject` | `reference` | レポートの対象となる患者 | `DiagnosticReport.subject`<br><br>([`Patient`](Patient)) |


## 2.1.3.3.2.7. その他、参考文献・リンク等

本プロファイルそのものの定義には影響しないが、レポートの標準化に関し以下の情報が参考となる。`presentedForm` に収容するレポートのコンテンツを作成するレポーティングシステムにおいて、標準化に関する参考資料となる。

- [RadReport](https://www.rsna.org/practice-tools/data-tools-and-standards/radreport-reporting-templates) - 放射線レポートテンプレート
- [RadLex radiology lexicon](https://www.rsna.org/practice-tools/data-tools-and-standards/radlex-radiology-lexicon) - 放射線科語彙集
- [RadElement](https://www.rsna.org/practice-tools/data-tools-and-standards/radelement-common-data-elements) - 放射線関連共通データエレメント
- [IHE Radiology Technical Framework Supplement - Management of Radiology Report Templates](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_MRRT.pdf)
