# 1.5. 検索
HL7®FHIR®規格では[検索クエリ](https://www.hl7.org/fhir/search.html)に使用できるパラメータは[SearchParameterリソース](https://www.hl7.org/fhir/searchparameter-registry.html)として定義されており，検索クエリはSearchParameterリソースのname, valueを用いて

    GET [base]/[type]?name=value&...

と表現される。

具体的には、

    GET [base]/Patient?gender=male

という検索クエリにおける"gender"はPatientリソースにおけるgenderプロパティを指しているのではなく，Patientリソースに対応した[id=individual-genderというSearchParameterリソース](https://www.hl7.org/fhir/searchparameter-registry.html)のname属性を示しており，このindividual-genderというSearchParameterリソースが検索対象としてPatient.genderを指定しているという構造になっている。

各SearchParameterには[type](https://www.hl7.org/fhir/searchparameter-definitions.html#SearchParameter.type)が定義されており、typeごとに[検索条件や対象とするDatatype, 各Datatypeで検索するフィールドなどが定義されている](https://www.hl7.org/fhir/search.html#ptypes)。また，各typeには，検索時に使用できる:text, :notなどのmodifierを組み合わせて使用することもできる。

なお，サーバー側はクエリに一致するリソースを返すが，[関連があると思われる追加の検索結果を返すことができる特権を有する](https://www.hl7.org/fhir/search.html)ことに注意する。

本節では特に日本において問題となりうる機能に限って記載する。実装者は検索機能を実装するにあたり、[Search](https://www.hl7.org/fhir/search.html)および[SearchParameter](https://www.hl7.org/fhir/searchparameter.html)について十分に理解しておくよう勧められる。

## 1.5.1. 文字列検索
FHIR®におけるテキストについての検索は大きく4種類に分けることができる。ここではType:modifierと表すことにし，条件がある場合は適宜カッコで補足する。

1. case sensitiveな完全一致
    - [string:exact](https://www.hl7.org/fhir/search.html#:~:text=The%20%3Aexact%20modifier%20returns%20results%20that%20match%20the%20entire%20supplied%20parameter%2C%20including%20casing%20and%20accents.)
    - [token](https://www.hl7.org/fhir/search.html#:~:text=Match%20is%20case%20sensitive) (ただし2.の例外あり)

2. case insensitiveな完全一致
    - token ([CodeSystem.caseSensitiveなどによりcase insensitiveなことが示されているとき](https://www.hl7.org/fhir/search.html#:~:text=unless%20the%20underlying%20semantics%20for%20the%20context%20indicate%20that%20the%20token%20should%20be%20interpreted%20case-insensitively))
    - token ([対象のDatatypeがstringのとき](https://www.hl7.org/fhir/search.html#:~:text=If%20the%20underlying%20data%20type%20is%20string%20then%20the%20search%20is%20not%20case%20sensitive))

3. 通常のテキスト検索
    - [string](https://www.hl7.org/fhir/search.html#string)
    - [string: contains](https://www.hl7.org/fhir/search.html#:~:text=The%20%3Acontains%20modifier%20returns%20results%20that%20include%20the%20supplied%20parameter%20value%20anywhere%20within%20the%20field%20being%20searched.)
    - [token: text](https://www.hl7.org/fhir/search.html#:~:text=Use-,%3Atext,-The%20search%20parameter) （code型などに対して、CodeableConcept.textなどのテキストデータを通常のstring型の検索を行う）  
基本的な文字列検索であり、患者名や住所，病名など検索がこのタイプである。FHIR®では，このタイプの検索において[大文字小文字の同一視，アクセントや他の発音区別符号の無視，句読点と連続する空白の無視](https://www.hl7.org/fhir/search.html#:~:text=This%20search%20is%20insensitive%20to%20casing%20and%20included%20combining%20characters%2C%20like%20accents%20or%20other%20diacritical%20marks)を規定している。JP Coreではこれに加えて、いわゆる全角文字（2バイト文字）と半角文字（1バイト文字）の正規化を必須とする（**SHOULD**）。なお、濁点半濁点の合成文字・結合文字については、発音区別符号の正規化としてFHIR®自体に規定されていると解釈される。実装上は、Unicodeの互換正規化（NFKCもしくはNFKD）に、大文字小文字の変換、句読点と連続する空白の処理を加えることで条件を満たすことができる。
サーバーは検索のときに、丸付き文字（①⇔1）、数字（2⇔Ⅱ⇔II⇔二）、ひらがな⇔カタカナ、[カタカナの正規化](https://www.scripts-lab.co.jp/mindsearch/mindsearchHypermanual/modectrl.html)（末尾の長音記号の削除、ベ⇔ヴェなど）、[新字体⇔旧字体](https://www.asahi-net.or.jp/~ax2s-kmtn/ref/old_chara.html)、統合漢字⇔互換漢字、異体字セレクタの処理、[住所の正規化](https://info.gbiz.go.jp/tools/imi_tools/index.html)、[病名の正規化](http://sociocom.jp/~data/2018-manbyo/index.html)など、必要性に応じて自由に追加の正規化を行うことができる（**MAY**）。クライアントは、サーバーが[関連があると思われる追加の検索結果を返すことができる特権を有する](https://www.hl7.org/fhir/search.html)ことに注意する。

4. 高度な全文検索(full text search)
    - [string: text](https://www.hl7.org/fhir/search.html#:~:text=An%20additional%20modifier%20%3Atext)
    - [_text](https://www.hl7.org/fhir/search.html#:~:text=text%20search%20parameters%2C-,_text,-and%20_content%2C%20search)
    - [_content](https://www.hl7.org/fhir/search.html#:~:text=parameters%2C%20_text%20and-,_content,-%2C%20search%20on%20the)  
_textと_contentはすべてのリソースに適応される[共通のsearch parameter](https://www.hl7.org/fhir/search.html#all)である。これらのSearchParameterは全文検索のためのSearchParameterであり、「[テキストをインデックス化する高度な検索機能をサポートすべきである（**SHOULD**）](https://www.hl7.org/fhir/search.html#:~:text=these%20parameters%20SHOULD%20support%20a%20sophisticated%20search%20functionality%20of%20the%20type%20offered%20by%20typical%20text%20indexing%20services)」とされており，加えて類語検索やあいまい検索，AND検索・OR検索なども実装することが望ましい。

## 1.5.2. 人名の検索について
組織ごとに患者記録が作成，維持されており，複数の組織でケアを受けている患者は，その情報が[複数のリソースに存在する可能性が高い](https://www.hl7.org/fhir/patient.html#scope)。多くの場合は氏名による検索や、姓の変更があった場合でも下の名前＋生年月日などの検索である程度候補を絞ることが可能である。一方で日本語表記を持たない外国人など，氏名を表す音をカタカナで表現した場合その方法は一意ではなく，複数システムとの連携を行う場合において，同一人物の突合が困難になる恐れがある。

将来的に組織・システムをまたいだMaster Patient Index(MPI)が整備されることがあれば、[MPIに患者の同一性を問い合わせるクエリ](https://www.hl7.org/fhir/patient.html#match)を用いることができる。
