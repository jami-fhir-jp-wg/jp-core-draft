Profile: JP_Procedure
Parent: Procedure
Id: JP_Procedure
Title: "JP_Procedure"
Description: "このプロファイルはProcedureリソースに対して、患者に対する医療的な処置のデータを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2020-09-04"
* ^publisher = "HL7 FHIR JP WG・・・"
* ^jurisdiction = urn:iso:std:iso:3166#JP "Japan"
* ^jurisdiction.text = "Jurisdiction"
* . ^short = "Procedureリソース"
* . ^definition = "An action that is or was performed on or for a patient. This can be a physical intervention like an operation, or less invasive like long term services, counseling, or hypnotherapy.\r\n\r\n患者に対して、または患者のために実行されているか実行されたアクション。これは、手術のような身体的介入、または長期サービス、カウンセリング、催眠療法のような低侵襲性である可能性がある。"
* . ^mustSupport = false
* id ^short = "Logical id of this artifact"
* contained ^short = "Contained, inline Resources"
* identifier ^definition = "これは、ビジネスプロセスによって定義され、リソース自体への直接のURL参照が適切でない場合に参照するために使用される、このProcedureに関連する識別子を記録する。"
* identifier ^comment = "これはビジネス識別子であり、リソース識別子ではありません（議論参照）。識別子は1つのリソースインスタンスにのみ表示されることがベストですが、ビジネス上の慣習により、同じ識別子を持つ複数のリソースインスタンスが存在することがあるかもしれません。例えば、複数のPatientとPersonリソースインスタンスが同じ社会保険番号を共有しているかもしれない。"
* identifier ^mustSupport = false
* identifier.use ^mustSupport = false
* identifier.type ^mustSupport = false
* identifier.system ^mustSupport = false
* identifier.value ^mustSupport = false
* identifier.period ^mustSupport = false
* identifier.assigner ^mustSupport = false
* instantiatesCanonical ^definition = "本Procedureの全部または一部を遵守するFHIR定義のプロトコル、ガイドライン、オーダーセット、その他の定義を指すURL."
* instantiatesUri ^definition = "本Procedrure全体または一部を遵守する、外部で管理されているプロトコル、ガイドライン、オーダーセット、またはその他の定義を指すURL。"
* basedOn ^short = "A request for this procedure　このプロシージャの依頼情報"
* basedOn ^definition = "このプロシージャの依頼情報の詳細を含むリソースへの参照。"
* basedOn ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不能などを可能にする）。解決には、URLからの検索、またはリソースタイプによって該当する場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索することができる。 \r\n\r\n【JPーCORE】\r\nObservation_LabResultにならい、任意。"
* basedOn ^mustSupport = false
* basedOn.reference ^mustSupport = false
* basedOn.type ^mustSupport = false
* basedOn.identifier ^mustSupport = false
* basedOn.display ^mustSupport = false
* partOf ^definition = "A larger event of which this particular procedure is a component or step.【JP仕様】https://www.hl7.org/fhir/procedure.htmlを参照"
* partOf ^comment = "The MedicationAdministration resource has a partOf reference to Procedure, but this is not a circular reference.   For example, the anesthesia MedicationAdministration is part of the surgical Procedure (MedicationAdministration.partOf = Procedure).  For example, the procedure to insert the IV port for an IV medication administration is part of the medication administration (Procedure.partOf = MedicationAdministration).\r\n\r\nMedicationAdministrationリソースにはProcedureへのpartOf参照があるが、これは循環参照ではない。たとえば、麻酔MedicationAdministrationは外科的処置の一部である（MedicationAdministration.partOf = Procedure）。\r\nまた、たとえば、IV投薬管理用にIVポートを挿入する手順は、投薬管理の一部である（Procedure.partOf = MedicationAdministration）。\r\n\r\n【JP-CORE】\r\nObservation_LabResultにならい、任意。"
* partOf ^mustSupport = false
* partOf.reference ^mustSupport = false
* partOf.type ^mustSupport = false
* partOf.identifier ^mustSupport = false
* partOf.display ^mustSupport = false
* status ^definition = "プロシージャの状態を指定するコードです。一般的には、進行中または完了した状態になります。【JP仕様】http://hl7.org/fhir/us/core/STU3.1/StructureDefinition-us-core-procedure.htmlを参照"
* status ^comment = "The \"unknown\" code is not to be used to convey other statuses.  The \"unknown\" code should be used when one of the statuses applies, but the authoring system doesn't know the current state of the procedure.\n\nThis element is labeled as a modifier because the status contains codes that mark the resource as not currently valid.\r\n\r\n「不明な」コードは、他のステータスを伝えるために使用されるべきではない。ステータスの1つが当てはまる場合、「不明」コードを使用する必要があるが、オーサリングシステムはプロシージャの現在の状態を認識していない。\r\nステータスにリソースを現在無効としてマークするコードが含まれているため、この要素は修飾子としてラベル付けされる。"
* status ^mustSupport = false
* statusReason ^definition = "プロシージャの現在の状態の理由を設定する。"
* statusReason ^comment = "This is generally only used for \"exception\" statuses such as \"not-done\", \"suspended\" or \"aborted\". The reason for performing the event at all is captured in reasonCode, not here.\r\n\r\nこれは通常、「未完了」、「一時停止」、「中止」などの「例外」ステータスにのみ使用される。イベントを実行する理由は、ここではなく、reasonCodeに設定する。"
* category 1..
* category ^definition = "検索、ソート、表示のためにProcedureを分類したコード（例：「外科的Procedure」）。"
* category ^comment = "すべての用語の使用がこの一般的なパターンに当てはまるわけではない。場合によっては、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係や事前・事後の調整を管理するための独自の構造を提供する必要があります。 \r\n【JPーCORE】JP_Conditionに合わせて必須。"
* category.coding ^short = "Code defined by a terminology system　ターミノロジーによって定義されたコード"
* category.coding ^definition = "A reference to a code defined by a terminology system.\r\nターミノロジーによって定義されたコードへの参照。"
* category.coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n\r\nコードは、列挙型またはコードリストで、SNOMED CTなどの非常に正式な定義まで、非常に柔軟に定義できます。詳細については、HL7v3コア原則を参照。コーディングの順序は定義されておらず、意味を推測するために使用してはならない。\r\n一般に、コーディング値の多くても1つだけが　UserSelected = true　としてラベル付けされる。"
* category.text ^short = "Plain text representation of the concept　この概念のシンプルなテキスト記述"
* category.text ^definition = "A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user.\r\n\r\nデータを入力したユーザーによって見られた/選択された/発声された、および/またはユーザーの意図された意味を表す概念の人間の言語表現。"
* category.text ^comment = "Very often the text is the same as a displayName of one of the codings.\r\n多くの場合、テキストはいずれかのコーディングのdisplayNameと同じです。"
* category.text ^requirements = "The codes from the terminologies do not always capture the correct meaning with all the nuances of the human using them, or sometimes there is no appropriate code at all. In these cases, the text is used to capture the full meaning of the source.\r\n用語のコードは、それらを使用する人間のすべてのニュアンスで常に正しい意味を捉えているとは限らない。または、適切なコードがまったくない場合もあります。このような場合、テキストはソースの完全な意味をキャプチャするために使用される。"
* code 1..
* code ^short = "Identification of the procedure　プロシジャーの識別子"
* code ^definition = "行われた具体的な手順。手技の正確な性質がコード化できない場合はテキストを使用する（例：「腹腔鏡下虫垂切除術」）"
* code ^comment = "すべての用語の使用がこの一般的なパターンに当てはまるわけではない。場合によっては、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係や事前・事後の調整を管理するための独自の構造を提供すべきである。"
* code ^mustSupport = false
* code ^binding.strength = #required
* code ^binding.description = "Procedureコード"
* subject only Reference(Patient)
* subject ^short = "Who the procedure was performed on　プロシジャーが実施された対象人"
* subject ^definition = "The person, animal or group on which the procedure was performed.\r\nプロシジャーが実行された対象の人、動物、またはグループ。"
* subject ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不能などを可能にする）。解決は、URLからの検索、またはリソースタイプによって該当する場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* subject ^mustSupport = false
* encounter ^short = "Encounter created as part of　一部として作成されたエンカウンター"
* encounter ^definition = "プロシジャーが作成または実行されたエンカウンター、またはこの記録の作成が緊密に関連しているエンカウンター。"
* encounter ^comment = "これは通常、イベントが発生した出会いの中で行われますが、活動によっては、出会いの公式な終了前または終了後に開始されても、出会いの文脈と結びついている場合があります。"
* performed[x] 1..
* performed[x] only dateTime or Period
* performed[x] ^short = "When the procedure was performed　プロシジャーが実施された時期"
* performed[x] ^definition = "Procedureが行われた推定または実際の日付、日時、期間、または年齢。複数の日付にまたがる複雑なProcdedureをサポートするために期間を許可し、Procdedureの長さを把握することも可能。"
* performed[x] ^comment = "Age is generally used when the patient reports an age at which the procedure was performed. Range is generally used when the patient reports an age range when the procedure was performed, such as sometime between 20-25 years old.  dateTime supports a range of precision due to some procedures being reported as past procedures that might not have millisecond precision while other procedures performed and documented during the encounter might have more precise UTC timestamps with timezone.\r\n\r\n年齢は一般的に、患者が手技が行われた年齢を報告するときに使用される。\r\n範囲は、一般的に、患者が手順が実行されたときに年齢範囲を報告する場合に使用される。たとえば、20〜25歳の間など。\r\ndateTimeは、ミリ秒の精度を持たない可能性がある過去の手順として報告される一部の手順と、エンカウンターの期間において実施され文書化された他の手順が、タイムゾーンでより正確なUTCタイムスタンプを持つ可能性があるため、さまざまな精度をサポートする。"
* performed[x] ^mustSupport = false
* recorder ^short = "Who recorded the procedure　プロシジャーを記録した人"
* recorder ^definition = "Individual who recorded the record and takes responsibility for its content.\r\n記録を記録し、その内容に責任を負う個人。"
* recorder ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要があります（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* asserter ^short = "Person who asserts this procedure　プロシジャーを実施したと報告する人"
* asserter ^definition = "Individual who is making the procedure statement.\r\nプロシジャー記録を作成している個人"
* asserter ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要があります（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* performer ^short = "The people who performed the procedure　プロシジャーを実施した人々"
* performer ^definition = "Limited to \"real\" people rather than equipment.\r\n医療機器ではなく「生身の人間」に限定。"
* performer.function ^definition = "Distinguishes the type of involvement of the performer in the procedure. For example, surgeon, anaesthetist, endoscopist.\r\nプロシジャーへの実施者の関与のタイプを区別します。たとえば、外科医、麻酔科医、内視鏡医。"
* performer.function ^comment = "すべての用語の使用がこの一般的なパターンに当てはまるわけではない。場合によっては、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係や事前・事後の調整を管理するための独自の構造を提供するべきです。\r\n\r\n 【JP-CORE】\r\n当面利用しない。"
* performer.actor ^short = "The reference to the practitioner　医療従事者への参照"
* performer.actor ^definition = "The practitioner who was involved in the procedure.\r\nプロシジャーに関わった医療従事者。"
* performer.actor ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不可などを可能にする）。解決には、URLからの検索、またはリソースタイプによって適用可能な場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索することができる。"
* performer.onBehalfOf ^short = "Organization the device or practitioner was acting for　従事した組織"
* performer.onBehalfOf ^definition = "The organization the device or practitioner was acting on behalf of.\r\n従事した組織"
* performer.onBehalfOf ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不能などを可能にする）。解決には、URLからの検索によるものと、リソースタイプによって該当する場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索するものがある。"
* location ^short = "Where the procedure happened　　プロシジャーが実施された場所"
* location ^definition = "プロシジャーが実施された場所。\r\n例：自宅での出生、レストランで気管切開など。"
* location ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要があります（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* reasonCode ^short = "Coded reason procedure performed　プロシジャーが実施された理由コード"
* reasonCode ^definition = "処置が行われたコード化された理由。\r\nこれはある種のコード化された実体であるかもしれないし、単にテキストとして存在するかもしれない。"
* reasonCode ^comment = "Use Procedure.reasonCode when a code sufficiently describes the reason.  Use Procedure.reasonReference when referencing a resource, which allows more information to be conveyed, such as onset date. Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nひとつのコードが理由を十分に説明している場合は、Procedure.reasonCodeを使用する。\r\nリソースを参照する場合は、Procedure.reasonReferenceを使用する。これにより、開始日など、より多くの情報を伝達できる。\r\nProcedure.reasonCodeとProcedure.reasonReferenceは、重複することを意図したものではない。単一の理由で、Procedure.reasonCodeまたはProcedure.reasonReferenceのいずれかだけを使用できる。\r\n Procedure.reasonCodeは要約コードの場合もあれば、Procedure.reasonReferenceを使用して、Condition | Observation | Procedure | DiagnosticReport | DocumentReference　のいずれかにより、非常に精緻な理由の定義を参照することもできる。\r\nもしプロシージャの異なる理由を説明しているのであれば、Procedure.reasonCodeとProcedure.reasonReferenceの両方を使用できる。"
* reasonReference ^short = "The justification that the procedure was performed　プロシジャーが実施された正当性"
* reasonReference ^definition = "なぜそのようなPlocedureを行ったのか、その正当性を示す。"
* reasonReference ^comment = "It is possible for a procedure to be a reason (such as C-Section) for another procedure (such as an epidural). Other examples include endoscopy for dilatation and biopsy (a combination of diagnostic and therapeutic use). \nUse Procedure.reasonCode when a code sufficiently describes the reason.  Use Procedure.reasonReference when referencing a resource, which allows more information to be conveyed, such as onset date. Procedure.reasonCode and Procedure.reasonReference are not meant to be duplicative.  For a single reason, either Procedure.reasonCode or Procedure.reasonReference can be used.  Procedure.reasonCode may be a summary code, or Procedure.reasonReference may be used to reference a very precise definition of the reason using Condition | Observation | Procedure | DiagnosticReport | DocumentReference.  Both Procedure.reasonCode and Procedure.reasonReference can be used if they are describing different reasons for the procedure.\r\n\r\nある手順が別の手順（硬膜外など）の理由（帝王切開など）になる可能性があります。他の例には、拡張および生検（診断および治療用途の組み合わせ）のための内視鏡検査が含まれます。\r\nコードが理由を十分に説明している場合は、Procedure.reasonCodeを使用する。\r\nリソースを参照する場合は、Procedure.reasonReferenceを使用する。これにより、開始日など、より多くの情報を伝達できる。\r\nProcedure.reasonCodeとProcedure.reasonReferenceは、重複することを意図したものではない。単一の理由で、Procedure.reasonCodeまたはProcedure.reasonReferenceのいずれかだけを使用できる。\r\n Procedure.reasonCodeは要約コードの場合もあれば、Procedure.reasonReferenceを使用して、Condition | Observation | Procedure | DiagnosticReport | DocumentReference"
* bodySite ^short = "Target body sites　対象の人体部位"
* bodySite ^definition = "詳細かつ構造化された解剖学的な位置情報。複数の場所を指定することができる。例えば、1つの病変に対して複数のパンチングバイオプシーを行うことができる。"
* bodySite ^comment = "If the use case requires attributes from the BodySite resource (e.g. to identify and track separately) then use the standard extension [procedure-targetbodystructure](extension-procedure-targetbodystructure.html).\r\n\r\nユースケースでBodySiteリソースの属性が必要な場合（たとえば、個別に識別して追跡するため）、標準の拡張extension　[procedure-targetbodystructure]（extension-procedure-targetbodystructure.html）を使用します。"
* outcome ^short = "The result of procedure　プロシジャーの結果"
* outcome ^definition = "The outcome of the procedure - did it resolve the reasons for the procedure being performed?\r\nProcedureの結果 - Procedureが行われた理由が解決されたか？"
* outcome ^comment = "If outcome contains narrative text only, it can be captured using the CodeableConcept.text.\r\n結果に叙述的記述トのみが含まれている場合は、CodeableConcept.textを使用してその情報を格納できる。"
* report ^short = "Any report resulting from the procedure　プロシジャーからのなんらかの結果報告"
* report ^definition = "This could be a histology result, pathology report, surgical report, etc.\r\nこれは、組織学的結果、病理学的報告書、手術報告書などであろう。"
* report ^comment = "There could potentially be multiple reports - e.g. if this was a procedure which took multiple biopsies resulting in a number of anatomical pathology reports.\r\n\r\n複数のレポートが存在する可能性がある\r\n-例：これが複数の生検を行ったプロシジャーであって、いくつもの解剖病理学報告が得られた場合。"
* complication ^short = "Complication following the procedure　プロシジャーに起こった合併症"
* complication ^definition = "Any complications that occurred during the procedure, or in the immediate post-performance period. These are generally tracked separately from the notes, which will typically describe the procedure itself rather than any 'post procedure' issues.\r\n\r\nプロシジャー中、またはその実施直後の期間に発生した合併症。これらは通常、note要素とは別に記録されます。note要素は通常、「プロシジャー後」の問題ではなく、プロシジャー自体を説明するものである。"
* complication ^comment = "If complications are only expressed by the narrative text, they can be captured using the CodeableConcept.text.\r\n合併症が叙述的なテキストによってのみ表現されている場合は、CodeableConcept.textに格納できる。"
* complicationDetail ^short = "A condition that is a result of the procedure　プロシジャーの結果であるような患者状態"
* complicationDetail ^definition = "Any complications that occurred during the procedure, or in the immediate post-performance period.\r\nProcedureの実施中、または実施直後に発生した全ての合併症。"
* complicationDetail ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要があります（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* complicationDetail ^requirements = "This is used to document a condition that is a result of the procedure, not the condition that was the reason for the procedure.\r\nこれは、プロシジャーの理由であった状態ではなく、プロシジャーの結果である状態を文書化するために使用される。"
* followUp ^short = "Instructions for follow up　フォローアップの指示"
* followUp ^definition = "If the procedure required specific follow up - e.g. removal of sutures. The follow up may be represented as a simple note or could potentially be more complex, in which case the CarePlan resource can be used.\r\n\r\n処置が特別なフォローアップを必要とする場合（例：抜糸）、フォローアップはシンプルなnote として表現してもよいが、より複雑になる可能性もあり、その場合はケアプランリソースを使用することができる。"
* followUp ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係と調整前後の関係を管理するための独自の構造を提供する必要がある。"
* note ^short = "Additional information about the procedure　プロシジャーの関する追加情報"
* note ^definition = "Any other notes and comments about the procedure.\r\nProcedureに関する注意点やコメントなど。"
* note ^comment = "For systems that do not have structured annotations, they can simply communicate a single annotation with no author or time.  This element may need to be included in narrative because of the potential for modifying information.  *Annotations SHOULD NOT* be used to communicate \"modifying\" information that could be computable. (This is a SHOULD because enforcing user behavior is nearly impossible).\r\n\r\n構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合があります。 \r\n*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザーの行動を強制することはほとんど不可能であるため、これはSHOULDです）。"
* focalDevice ^short = "Manipulated, implanted, or removed device　操作、埋め込み、または削除されたデバイス"
* focalDevice ^definition = "A device that is implanted, removed or otherwise manipulated (calibration, battery replacement, fitting a prosthesis, attaching a wound-vac, etc.) as a focal portion of the Procedure.\r\n\r\nProcedureが行われる局所に、あるいは、そこから、埋め込まれる、取り外される、またはその他の操作（キャリブレーション、バッテリー交換、プロテーゼの装着、陰圧ドレインバックの装着など）が行われるデバイス。"
* focalDevice.action ^definition = "Procedure中にデバイスに起こった変化の種類。【JP仕様】https://www.hl7.org/fhir/procedure.htmlを参照"
* focalDevice.manipulated ^definition = "Procedure中に操作（変更）されたデバイス。【JP仕様】https://www.hl7.org/fhir/procedure.htmlを参照"
* usedReference ^short = "Items used during procedure　プロシジャー中に使用されるアイテム"
* usedReference ^definition = "Identifies medications, devices and any other substance used as part of the procedure.\r\n\r\nプロシジャーの一部として使用される薬剤、機器およびその他の物質を特定する。"
* usedReference ^comment = "For devices actually implanted or removed, use Procedure.device.\r\n\r\n実際に埋め込まれた、または取り外されたデバイスについては、Procedure.deviceを使用すること。"
* usedCode ^short = "Coded items used during the procedure　プロシジャー中に使用したアイテムのコード"
* usedCode ^definition = "Identifies coded items that were used as part of the procedure.\r\nProcedureの一部として使用されたコード化されたアイテムを識別する。"
* usedCode ^comment = "For devices actually implanted or removed, use Procedure.device.\r\n実際に埋め込まれた、または取り外されたデバイスについては、Procedure.deviceを使用すること。"