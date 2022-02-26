# 2.1.3.2.1. JP Core ImagingStudy Radiology (放射線検査用)プロファイル
## 2.1.3.2.1.1. 概略
患者の画像検査（DICOM画像で情報が取得される検査）に関する情報

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology |
| バージョン     | 1.0.0                                               |
| 名前           | JPCoreImagingStudyRadiologyProfile                           |
| タイトル       | JP Core ImagingStudy Radiology Profile                               |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | このプロファイルはImagingStudyリソースに対して、ひとつの画像検査のデータを送受信するための基礎となる制約と拡張を定めたものである。  |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| ソースリソース | https://simplifier.net/jpcore/jpimagingstudy   |


本プロファイル説明は、患者に付属する画像検査情報について、情報の登録や検索、取得のために、FHIR `ImagingStudy`リソースを使用するにあたっての、最低限の制約を記述したものである。


`ImagingStudy` リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

<br>

### 2.1.3.2.1.1.1. 背景および想定シナリオ

本プロファイルは、一般的な画像検査でDICOMで定義される画像情報を取り扱うことを想定している。Non-DICOMの画像を取り扱う場合は[`Media`リソース](http://www.hl7.org/fhir/media.html)を利用すること。


`ImagingStudy` リソースはDICOM画像検査において作成された内容（主としてDICOM タグ情報に相当する）を表す。一つの検査はシリーズを構成しており、それぞれのシリーズにはSerivce-Objext Pairインスタンス(SOPインスタンス）が一般的なタグ情報の中に含まれる。一つのシリーズにはただ一つのモダリティ(例えば単純エックス線撮影，CT，MRI，超音波のいずれか）から成り立つが、一つの検査は異なるモダリティによる複数のシリーズから構成されることがある。


 - `Patient`リソースからの指定された日時、期間での画像検査情報の参照
 - `ImagingStudy`リソースから指定したモダリティに関する検査の画像検査情報の参照
 - `ImagingStudy`リソースから指定したモダリティに関するシリーズの画像検査情報の参照
 - `ImagingStudy`リソースから指定した部位の画像検査情報の参照
 - `ImagingStudy`リソースから使用可能な画像検査情報の参照
 - `Encounter`リソースから画像検査を実施した検査の画像検査情報の参照
 - `ServiceRequest`リソースから画像検査を実施した検査の画像検査情報の参照

なお、`ServiceRequest`リソースは画像検査を実施するために発生するオーダ情報等を格納しうるリソースであるが、オーダリング情報の標準化の状況や情報の粒度によりユースケースが異なることが想定される。よって、`ServiceRequest`から提供され本リソースにマッピングされるべき情報の定義については`ServiceRequest`および一連の`TASK`管理あるいは`Procedure`に関連するユースケースで別途検討される。

<br>

### 2.1.3.2.1.1.2. スコープ

`ImagingStudy`リソースはDICOMのstudy, seriesおよび画像に関連する情報を提供し、それらの情報をどのようにして取り出すか（native DICOMフォーマットで受け取るか、JPEGなどの一般的な画像情報に変換したものを受けとるかなど）を示す。`ImagingStudy`は一つのDICOM studyのすべての情報を網羅するために用いられる。

このリソースでは32ビットのタグ（DICOMタグと呼ばれる）で示されるDICOMアトリビュート（タグ情報）をmappingするためのエレメントが用意されている。
DICOMタグは4桁の16進数がコンマで区切られたペア（例　(0008, 103E) )として表現される。それぞれのタグ情報に関する名称と値のペアについては[DICOM Part6 Data Dictionary](http://medical.nema.org/medical/dicom/current/output/html/part06.html)に記載されている。さらに、情報体の中のタグ情報の用途については[DICOM Part 3 Information Object Definitions](http://medical.nema.org/medical/dicom/current/output/html/part03.html)に記載されている。Number of Instances in StudyなどのDICOMにおける問い合わせモデルに関する情報は[ DICOM Part 4 Annex C](http://medical.nema.org/medical/dicom/current/output/html/part04.html#chapter_C)で参照できる。

最も単純な場合、`ImagingStudy`はDICOM query（例えばQIDO-RS）を行うことなく重要なDICOMタグ情報へのアクセスを提供する。一方で、DICOMの実画像情報などのインスタンスは`ImagingStudy`リソースには保存されないため、この情報を保存するためにはDICOM WADO-RSサーバやほかのストレージ機能を利用する必要がある。
（FHIRではREST APIを用いることが想定されており，親和性の観点からはDICOM web accessの利用が想定される。）

`ImagingStudy`は一つのDICOM studyに対してのリファレンスであり、またそのスタディのサブセットに対する参照にも利用できる。一方で、複数の`ImagingStudy`リソースが同じDICOM studyを参照することや，同じDICOM study内の異なるサブセット（シリーズ）を参照することもあり得る。

このプロファイルでは上記のようなDICOMに関連して用いられる `ImagingStudy`の用途がスコープであり、`ImagingStudy`の情報項目の１つを取り扱う際に、必要な要件を定義している。

## 2.1.3.2.1.2. 関連するプロファイル

このプロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

 - [`Patient`](https://simplifier.net/jp-core-draftv1/jppatient)
 - [`Encounter`](Encounter)
 - [`CarePlan`](http://hl7.org/fhir/careplan.html)
 - [`Specimen`](http://hl7.org/fhir/specimen.html)
 - [`Condition`](Condition)
 - [`Location`](Location)
 - [`Procedure`](Procedure)
 - [`Endpoint`](http://hl7.org/fhir/endpoint.html)
 - [`Practitioner`](Practitioner)
 - [`DiagnosticReport`](DiagnosticReportRadiology)
 - [`Observation`](Observation)

## 2.1.3.2.1.3. リソース定義

- [リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpimagingstudy)

- [リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpimagingstudy/$download?format=json)


{{tree:jp-core-draftv1/JPImagingStudy,snapshot}}

<br>

### 2.1.3.2.1.3.1. 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

#### 2.1.3.2.1.3.1.1. 必須
`ImagingStudy`リソースは、次の要素を持たなければならない。

- `status`︓検査項目情報の状態は必須である。
- `subject`︓このリソースが示す検査項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須である。

#### 2.1.3.2.1.3.1.2. MustSupport
`ImagingStudy`リソースは、以下をサポートしなければならない。

- 画像データが送信システムに存在する場合には`identifier`, `modality`はサポートされなければならない。
- 画像データが送信システムにSeriesが存在する場合には, `series.uid`, `series.modality`, `series.instance.uid`, `series.instance.sopClass`はサポートされなければならない。
- 画像検査を行うためのオーダ情報が送信システムに存在する場合には, `encouter`と`basedOn`はサポートされなければならない。

<br>

### 2.1.3.2.1.3.2. Extension定義

このプロファイルでは拡張定義は行っていない。

<br>

### 2.1.3.2.1.3.3. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `ImagingStudy.modality` | 全シリーズで用いられているモダリティのリスト。(0008,0060), (0008, 0061)をOR条件で記述し、重複する値は１つにまとめて表現する。 | Extensible | [DICOM Part16 CID29 Acquisition Modality](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html) |
| `ImagingStudy.series.modality` | このシリーズのモダリティ |  Extensible | [DICOM Part16 CID29 Acquisition Modality](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html) |
| `ImagingStudy.series.bodySite` | このシリーズの撮像対象となった解剖学的部位 | Example | [DICOM Part16 Annex L](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_L.html) |


<br>

### 2.1.3.2.1.3.4. 制約一覧

このプロファイルでは制約定義は行っていない。

## 2.1.3.2.1.4. 利用方法

### 2.1.3.2.1.4.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

<br>

### 2.1.3.2.1.4.2. OperationおよびSearch Parameter 一覧

<br>

#### 2.1.3.2.1.4.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
 | SHOULD | `subject(Patient)` | `reference` | `GET [base]/ImagingStudy?subject=Patient/123` |
 | SHOULD | `subject,modality` | `reference`,`token` | `GET [base]/ImagingStudy?subject=Patient/123&modality=CT` |
 | SHOULD | `subject`,`bodysite` | `reference`,`token` | `GET [base]/ImagingStudy?subject=Patient/123&bodysite=T-15460` |
 | SHOULD | `subject`,`started` | `reference`,`date` | `GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-25` |
 | SHOULD | `subject`,`started`,`modality`,`bodysite` | `reference`,`date`,`token`,`token`  | `GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-18&modality=CT&bodysite=T-15460` |
 | SHOULD | `encounter` | `reference`  | `GET [base]/ImagingStudy?encounter=Encounter/456` |


<br>

#### 2.1.3.2.1.4.2.2. 操作詳細

<br>

##### 2.1.3.2.1.4.2.2.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。（SHALL）
`ImagingStudy`リソースでは検索の多様性が求められるため、必須としての検索項目は定義していない。

<br>

##### 2.1.3.2.1.4.2.2.2. 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1.患者中心での検索：対象患者（= `Patient`リソース）を条件とした検索をサポートすることが望ましい。

   ```http
   GET [base]/ImagingStudy?subject={reference}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?subject=Patient/123
   ```

<br>

2.モダリティ中心の検索：対象患者（= `Patient`リソース）と撮影に使用されたモダリティを条件とした検索をサポートすることが望ましい。


   ```http
   GET [base]/ImagingStudy?subject={reference}&modality={token}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?subject=Patient/123&modality=CT
   ```
<br>

3.部位中心の検索：対象患者（= `Patient`リソース）と撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい。


   ```http
   GET [base]/ImagingStudy?subject={reference}&bodysite={token}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?subject=Patient/123&bodysite=T-15460
   ```
<br>

4.日付中心の検索：対象患者（= `Patient`リソース）と撮影の日時を条件とした検索をサポートすることが望ましい。


   ```http
   GET [base]/ImagingStudy?subject={reference}&started={date}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?subject=subject=Patient/123&data=eq2021-06-25
   ```

<br>

5.日付中心の検索：対象患者（= `Patient`リソース）と撮影の日時を条件とした検索をサポートすることが望ましい。


   ```http
   GET [base]/ImagingStudy?subject={reference}&started={date}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?subject=subject=Patient/123&data=eq2021-06-25
   ```

<br>
   
6.複数の条件を組み合わせた検索：対象患者（= `Patient`リソース）、撮影の日時、撮影に使用されたモダリティ、撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい。


   ```http
   GET [base]/ImagingStudy?subject={reference}&data={date}&modality={token}&bodysite={token}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-18&modality=CT&bodysite=T-15460
   ```

<br>
   
7.来院情報中心の検索：来院情報（= `Encounter`リソース）を条件とした検索をサポートすることが望ましい。


   ```http
   GET [base]/ImagingStudy?encounter={reference}
   ```

   例：

   ```http
   GET [base]/ImagingStudy?encounter=Encounter/456
   ```



<br>

##### 2.1.3.2.1.4.2.2.3. オプション検索パラメータ

このプロファイルではオプション検索パラメータ定義は行っていない。

<br>

#### 2.1.3.2.1.4.2.3. Operation一覧

このプロファイルではオペレーション定義は行っていない。

<!--
#### 2.1.3.2.1.4.2.4. サンプル
-->