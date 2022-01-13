# 1.2. CardinalityとMustSupport組み合わせ
---
この節では各CardinalityとMustSupportの状態ごとのサーバおよびクライアント動作について表形式にて記載している。なお、データが存在しない場合の取り扱いについては、[1.3. データが存在しない場合の扱い](Handling of non-existent data)にて詳細を記載した。

[最小Cardinalityが1であることは、必ずしも有効なデータを持つことを意味しない](https://www.hl7.org/fhir/conformance-rules.html#:~:text=an%20element%20to%20a-,minimum%20cardinality%20of%201,-does%20not%20ensure)。最小Cardinalityが1であることは、要素が存在することのみを要求しており、例えば、その要素はDataAbsentReason拡張のみを持つかもしれない。

プロファイルによっては、各要素のCardinalityに加えてConstraintsによってさらなる制約が規定されていることがあるので注意する。

|  MustSupport有無  |  Cardinality  |  Queryケース<BR>(Server)  |  Queryケース<BR>(Client) |  Create / Update ケース<BR>(Client)  |  Create / Update ケース<BR>(Server)  |
| ---- | ---- | ---- | ---- | ---- | ---- |
|  無  |  0..1, 0..*  |  **(MAY)** この要素に対応するデータを送信／中継してもよい（必須ではない） <BR><BR> |  **(SHOULD NOT)** この要素が受信できることを前提とした実装をしてはいけない  |  **(MAY)** この要素に対応するデータを送信／中継してもよい（必須ではない） | **(MAY)** 受信した要素を無視してもよい |
|  無   |  1..1, 1..*  |  **(SHALL)** 要素を送信/転送しなければならない<BR><BR>**(※SHALL)** 値を持たない場合、DataAbsentReason拡張などを用いて要素を作成しなければならない |  **(SHOULD)** この要素が受信されることを想定した実装を行う<br><br> |  **(SHALL)** 値を持つデータ要素を送信/転送しなければならない<BR><BR>**(※SHALL)** 値を持たない場合、DataAbsentReason拡張などを用いて要素を作成しなければならない  | **(MAY)** 受信した要素を無視してもよい  |

JP Coreでは、日本国内で患者データにアクセスするための最小限の適合性要件を定めるという理念に基づき、いずれの要素にもMustSupportを付与しなかった。なお、本プロファイルから派生するプロファイルにおいては下記のMustSupport定義を推奨する（**MAY**）。


|  MustSupport有無  |  Cardinality  |  Queryケース<BR>(Server)  |  Queryケース<BR>(Client) |  Create / Update ケース<BR>(Client)  |  Create / Update ケース<BR>(Server)  |
| ---- | ---- | ---- | ---- | ---- | ---- |
|  有  |  0..1, 0..*  |  **(SHALL)** 利用可能な値が設定されたデータ要素を送信／中継する<BR><BR>**(SHOULD NOT)** 値が無効な場合データ要素を送信すべきではなく、欠損値を送信する|  **(SHOULD)** データが利用可能な場合、この要素を受信することを前提とします<BR><BR>**(SHOULD)** レスポンスでデータ要素が見つからない場合は、欠損値を扱うことを想定する。 |  **(SHALL)** 値が有効な場合データ要素を送信して中継しなければならない<BR><BR>**(SHOULD NOT)** 値が無効な場合データ要素を送信すべきでなく、欠損値を送信する  | **(SHALL)** 要素のデータを受信/中継/保存できなくてはならない   |
|  有  |  1..1, 1..*  |  **(SHALL)** 値を含むデータ要素を送信して中継しなければならない  |  **(SHOULD)** この要素の値が受信されると前提とします   |  **(SHALL)** 値を含むデータ要素を送信して中継しなければならない  | **(SHALL)** 要素のデータを受信/中継/保存できなくてはならない  |
