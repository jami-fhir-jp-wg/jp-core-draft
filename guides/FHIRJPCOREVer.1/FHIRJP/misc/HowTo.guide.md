# 付録. 実装ガイド記載方法について

## 1. プロファイル記載方法
- 「である」調で記載すること
- 構成は[テンプレート](Template2)に合わせて記載すること

## 2. 章番号について
### 2.1. 各ページにおける記載ルール
最終的に章番号を割り振るが、以下の区分に分けることとする。最大６区分までが可能

 ` # 先頭タイトル `

 ` ## 第１区分 `

 ` ###　第２区分 `

 ` ####　第３区分 `

### 2.2. 章番号の記載ルール
 `{#マーク}{スペース}({数字}{ピリオド})+{スペース}`とする

 
 ` 例) ## 1.2. タイトル ` 

## 3. 定義URLについて
### 3.1. CanonicalNameの命名規則
[http://jpfhir.jp/fhir/]配下を以下の命名規則とする

http://jpfhir.jp/fhir/{ユースケース名}/StructureDefinition/{profile名}

今回のCoreに関するリソースについては下記の通りになる。
http://jpfhir.jp/fhir/core/StructureDefinition/{profile名}

### 3.2. JP-Core のExtensionの命名規則

http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_(Resource名)_(extension対象Element名)_(Extension名称）


URIの階層にExtension をいれる。
Extension名内にはatを使わず、MedicationRequest_DispenseRequest_InstructionForDispense　のようにアンダースコアーで連結する。
アンダースコアーで連結される要素の第１要素は必ずリソース名またはcomplexデータタイプ名とし、そのあとにElement名をアンダースコアーで連結し、最後に出現するアンダースコアーの直前の要素が、そのExtensionがぶら下がる対象のリソース、データタイプまたはそのElementとなるように記述する。

```
例1）http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense
例2）http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_Hogehoge
```


## 4. 用語集

|正式表記|揺れの例|
|----|----|
|JP Core|Jp Core, JP CORE, JP core|
|プロファイル|プロフィール|


## 5. QA

### 5.1. Q. 文書の途中のリンクの色を変えることはできますか？
A. 下記の記述にてリンクを作成することができます。
```
ここのリンク[https://www.nexehrs-cpc.jp/](https://www.nexehrs-cpc.jp/)をクリックしてください。
```
ここのリンク[https://www.nexehrs-cpc.jp/](https://www.nexehrs-cpc.jp/)をクリックしてください。

### 5.2. Q. Markdownにて表を作成しましたが列幅が調整できません。
A. 以下の方法で調整は可能です。

[修正前]

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|依頼科|依頼科を格納するための拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_RequestDepartment|CodeableConcept|

#### 5.2.1. imageタグで調整

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|依頼科|依頼科を格納するための拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_RequestDepartment|CodeableConcept|
|<image width=100 />|<image width=150 />|||

```

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|依頼科|依頼科を格納するための拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_RequestDepartment|CodeableConcept
|<image width=100 />|<image width=150 />|||
```

#### 5.2.2. 空白で調整
|拡張&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|説明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|URL|値の型|
|------------|-------------|----------|-----|
|依頼科|依頼科を格納するための拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_RequestDepartment|CodeableConcept|
||

