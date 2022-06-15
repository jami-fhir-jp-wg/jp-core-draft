Profile: JP_HumanName
Parent: HumanName
Id: JP_HumanName
Description: "このプロファイルはHumanName DataTypeに対して、患者のデータを送受信するための基礎となる制約と拡張を定めたものである。"
// extension 参照宣言
* extension contains $iso21090-EN-representation named NameRepresentationUse 0..*
//
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_HumanName"
* ^version = "0.0.1"
* ^date = "2020-09-29T10:20:29.8265054+00:00"
* . ^short = "Name of a human - parts and usage　人の名前情報、その一部分と使い方"
* . ^definition = "A human's name with the ability to identify parts and usage.\r\n\r\n識別のための人の名前情報、"
* . ^comment = "Names may be changed, or repudiated, or people may have different names in different contexts. Names may be divided into parts of different type that have variable significance depending on context, though the division into parts does not always matter. With personal names, the different parts might or might not be imbued with some implicit meaning; various cultures associate different importance with the name parts and the degree to which systems must care about name parts around the world varies widely.\r\n\r\n名前が変更されたり、違っていると指摘されたり、コンテキストによって使われる名前が異なる場合がある。名前は、コンテキストに応じて重要性が異なるさまざまなタイプの部分に分割される場合があり、部分への分割は必ずしも重要ではない。個人名の場合、さまざまな部分に暗黙の意味が含まれている場合と含まれていない場合がある。さまざまな文化が名前の部分にさまざまな重要性を関連付けており、システムが世界中の名前の部分を気にする必要がある程度は大きく異なる。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[NameRepresentationUse] only $iso21090-EN-representation
* extension[NameRepresentationUse] ^sliceName = "NameRepresentationUse"
* extension[NameRepresentationUse] ^definition = "Name Representation.\r\n\r\n名前の表現方法"
* extension[NameRepresentationUse] ^comment = "The transcription of the name - how it is represented (for e.g. Japanese names).\r\n\r\n名前の文字起こし-表現方法（日本の名前など）。"
* use ^definition = "Identifies the purpose for this name.\r\n\r\nこの名前の使用目的"
* use ^comment = "Applications can assume that a name is current unless it explicitly says that it is temporary or old.\r\n\r\nアプリケーションは、名前が明示的に一時的な名前（temp ）あるいは以前の名前だ（old ）と設定されていない場合には、現時点での名前だとみなしてよい。"
* use ^requirements = "Allows the appropriate name for a particular context of use to be selected from among a set of names.\r\n\r\n一連の名前の中から、特定の使用状況に適した名前を選択できるようになる。"
* use ^mustSupport = false
* text ^short = "Text representation of the full name　名前全体のテキスト表現"
* text ^definition = "Specifies the entire name as it should be displayed e.g. on an application UI. This may be provided instead of or as well as the specific parts.\r\n\r\nアプリケーションUIなどで、表示する名前全体を指定する。名前の特定の部分の代わり、または特定の部分と同じとして使われることがある。"
* text ^comment = "Can provide both a text representation and parts. Applications updating a name SHALL ensure that when both text and parts are present,  no content is included in the text that isn't found in a part.\r\n\r\nテキスト要素の表現とその部分構成要素の両方を提供できる。名前を更新するアプリケーションは、テキストと部分構成要素の両方が存在する場合、部分構成要素にないコンテンツがテキスト要素に含まれないようにする必要がある。"
* text ^mustSupport = false
* family ^short = "Family name (often called 'Surname')　名前のうち姓の部分。ファミリ名"
* family ^definition = "The part of a name that links to the genealogy. In some cultures (e.g. Eritrea) the family name of a son is the first name of his father.\r\n\r\n家系図にリンクする名前の部分。一部の文化では、息子の家系の名前は父親の名である。"
* family ^comment = "Family Name may be decomposed into specific parts using extensions (de, nl, es related cultures).\r\n\r\nファミリ名は、拡張子（de、nl、es関連のカルチャ）を使用して特定の部分に分解できる。"
* family ^mustSupport = false
* given ^short = "Given names (not always 'first'). Includes middle names　名前の名の部分で、ミドルネームを含む。"
* given ^definition = "Given name.\r\n\r\n名前の名の部分。"
* given ^comment = "If only initials are recorded, they may be used in place of the full name parts. Initials may be separated into multiple given names but often aren't due to paractical limitations.  This element is not called \"first name\" since given names do not always come first.\r\n\r\nイニシャルのみが記録されている場合は、フルネームの部分の代わりに使用できる。イニシャルは複数の名前に分けることができるが、多くの場合、実用的な制限のためではない。名が常に最初に来るとは限らないため、この要素は「first name」とは呼ばない。"
* given ^mustSupport = false
* prefix ^short = "Parts that come before the name　名前の名の前に来る部分"
* prefix ^definition = "Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that appears at the start of the name.\r\n\r\n学問的、法的な、雇用または貴族の地位などのために称号として取得され、名前の先頭に表示される名前の一部。"
* prefix ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n\r\nFHIR文字列のサイズは1MBを超えてはならないことに注意。"
* suffix ^short = "Parts that come after the name　名前の名のあとに続く部分"
* suffix ^definition = "Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that appears at the end of the name.\r\n\r\n学問的、法的な、雇用または貴族の地位などのために称号として取得され、名前の最後に表示される名前の一部。"
* suffix ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n\r\nFHIR文字列のサイズは1MBを超えてはならないことに注意。"
* period ^short = "Time period when name was/is in use　名前が使われる期間"
* period ^definition = "Indicates the period of time when this name was valid for the named person.\r\n\r\nこの名前が指名された人に対して有効であった期間。"
* period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n\r\nPeriod（期間）は時間の範囲を指定します。使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、範囲から1つの値が適用されるか（たとえば、「この2回の間に患者に投与する」）を指定する。\r\nPeriod（期間）は、Duration（時間区間＝経過時間の測定値）には使用されない。 [Duration]（datatypes.html＃Duration）を参照のこと。"