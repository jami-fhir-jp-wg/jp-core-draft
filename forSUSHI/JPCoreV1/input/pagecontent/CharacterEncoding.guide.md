# 1.4. 文字コード
HL7®FHIR®規格では，文字コードとしてUnicodeを用い，UTF-8で符号化されることを前提としている。

規格の中に、「クライアントはURLをUTF-8を用いてエンコードし、サーバーはUTF-8が用いられているとしてデコードしなければならない（**SHOULD**）([3.1.0.1.2 Service Base URL](https://www.hl7.org/fhir/http.html))」、「application/fhirというmime typeはUTF-8エンコーディングを用いなければならない（**SHALL**）([3.1.0.1.9 Content Types and encodings](https://www.hl7.org/fhir/http.html#mime-type))」、「string型：Unicode文字のシーケンス([2.24.0.1 Primitive Types](https://www.hl7.org/fhir/datatypes.html#primitive))」といった記載がある。FHIR®においてURLエンコードにおけるUTF-8の使用は**SHOULD**ステートメントとなっており，UTF-8以外の文字コードを用いることも可能である。UTF-8以外の文字コードを使用する場合，どのような場合にどの文字コードを使用するのかCapabilityStatementに明確に記載する必要がある。

サーバーは「[updateもしくはcreateを受け入れるときは送信された通りに受け入れ，のちにreadアクセスがあった際には同じ内容を返すべき（**SHOULD**）](https://www.hl7.org/fhir/http.html#update、https://www.hl7.org/fhir/http.html#create)」とされているが、[3.1.0.13 Transactional Integrity](https://www.hl7.org/fhir/http.html#transactional-integrity)に記載されているように、既存のコンテンツとのマージや，ビジネスルールの適用による変換，リソースとして可能な値すべてをサポートしていないといった様々な理由で，返される内容が変化していることがある。サーバーおよびクライアントは，「[このような整合性がどのように扱われるかCapabilityStatementに明確に記載しなければならない（**SHOULD**）](https://www.hl7.org/fhir/http.html#conformance-rules)」とされている。このことから、サーバー側での不可逆な文字コード変換は推奨されず、行う場合はCapabilityStatementに明確に記載しなければならない。

## 1.4.1.    私的領域
FHIR JPにおいては，相互運用性確保のためUnicodeの私的領域（E000～F8FF），補助私的領域A(FFF80～FFFFF)，補助私的領域B(10FF80～10FFFF)は利用するべきではない（**SHOULD NOT**）。とくにオープンなシステムに対して，特段の規定がない限りユーザー定義外字領域を利用したデータを送信することは避けるべきである。氏名および地名についてはIPAの[文字情報基盤事業](https://moji.or.jp/mojikiban/mjlist/)により[戸籍統一文字（約5万6千字）・住基ネット登録文字（約2万字）のUnicode化が完了して](https://k-tai.watch.impress.co.jp/docs/news/1098780.html)おり、外字が必要となる場面は限定される。

## 1.4.2. 基本多言語面（Basic Multilingual Plane, BMP）外の文字や異体字セレクタ
一部の古いプログラム・ライブラリではこれらの文字を入力するとエラーを生じてしまうものもある。しかし、BMP外の文字や異体字セレクタについても，エラーなく送受信可能であるべきであり，サーバーは「[updateもしくはcreateを受け入れるときは送信された通りに受け入れ，のちにreadアクセスがあった際には同じ内容を返すべき（SHOULD）](https://www.hl7.org/fhir/http.html#update)」である。

なお、Unicode6.3においてCJK互換漢字と等価なCJK統合漢字と異体字セレクタの組み合わせがStandardized Variantsに登録され、Standardized Variation Sequense(SVS)として利用可能になった。今のところ広く用いられているわけではないものの、これはUnicode上での重複符号化を生じ、主に検索の場面などで潜在的に意図しない挙動の理由となりうる。詳しくは、[1.5.1 文字列検索](https://simplifier.net/guide/jpfhirjp/Search)を参照のこと。

## 1.4.3. Bytes Order Mark, BOM
FHIR®において[JSONフォーマットはRFC8259に従う](https://www.hl7.org/fhir/json.html#2.6.2)こととされており、[RFC8259](https://www.rfc-editor.org/rfc/rfc8259)では「[BOMは付加してはならない（**MUST NOT**）が，相互運用性のためにJSONテキストを解析する実装はエラーとして扱うのではなくBOMを無視してパースしてもよい（**MAY**）](https://www.rfc-editor.org/rfc/rfc8259#section-8.1)」と規定されている。

一方で，XMLやRDFといった他のContent Typesについて同様の定めはないが，JSONに準じて，BOMを付加してはならず（**SHALL NOT**），解析する実装においてはエラーとせずに無視してパースしてもよい（**MAY**）とする。

## 1.4.4. 改行コード
FHIR®において改行コードについての規定は特に存在せず、[string型においてCR・LFを含むことができる](https://www.hl7.org/fhir/datatypes.html#primitive)という記載があるのみである。他のデータと同様に「[updateもしくはcreateを受け入れるときは送信された通りに受け入れ，のちにreadアクセスがあった際には同じ内容を返すべき（SHOULD）](https://www.hl7.org/fhir/http.html#update)」であり、何らかの変換がなされる場合は「[CapabilityStatementに明確に記載しなければならない（SHOULD）](https://www.hl7.org/fhir/http.html#conformance-rules)」。

## 1.4.5. Unicodeへの文字コード変換に伴う往復の保全性（round trip safety）
この項目はFHIR®システムの範囲外であるが，影響を受けるシステムが多いと考えられ，ここに概略を記す。Shift-JIS, CP932などを用いるシステムからUnicode（UTF-8）に変換してFHIRサーバーに登録し，そこからデータを受け取って再変換して用いるケースを考える。

[Unicodeでは任意の部分集合による実装も認められており](https://www.ogis-ri.co.jp/otc/hiroba/technical/program_standards/part1.html)、重複符号化がなくUnicodeと一対一の変換表が用意できるような文字コードについては、全てのクライアント・サーバーで共通の変換表を用いる限りにおいて往復の保全性と相互運用性を確保した利用が可能となる。

一方で重複符号化を持つ文字コード（例えば、CP932ではIBM拡張文字などを中心に複数の文字が重複符号化されている）について，多対一でUnicode変換をしてしまうと往復の保全性が保たれない。Unicodeのユーザー定義外字領域を用いて往復の保全性を確保する実装も考えられるが，他のシステムとの相互運用性とトレードオフとなる。また、検索についても重複符号化を加味した実装が必要となる。

サーバー上の整合性についてはCapabilityStatementに記述されているはず（**SHOULD**）であるが，厳密な往復の保全性が必要な場合，サーバー上で何らかの変換がなされないか十分にテストを行うべきである。

## 1.4.6. 文字コード変換にまつわる諸問題
円記号，バックスラッシュ，チルダ，オーバーライン，波ダッシュなど文字コード変換しばし問題となる文字が知られている(https://xtech.nikkei.com/it/article/COLUMN/20061122/254626/?P=2)。
Shift-JISの円記号(0x5c)を，Unicodeの円記号(U+00A5)ではなくASCIのバックスラッシュ(0x5c)に準じてバックスラッシュ(U+005c)にマップするなど慣習的な変換も広く用いられており，文字の使用意義に沿った変換を行うべきである。