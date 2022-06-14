# 3. Security
---
ここで扱っているTransactionの多くは、患者の医療や健康に関する重要な情報を扱っている。データの扱いに方によっては、情報流出リスクを伴い、社会的な信頼を失うことも想定される。すべてのTransactionは、適切なアクセス権限の設定やサービスの公開方法、データの暗号化等を実施した上で、データを保護する必要がある。  
本対象は、健康医療データを扱う機関であり、医療福祉施設およびサービス・システム提供業者の両方に当てはまる。 ここで記載されている内容は最低限考慮すべき事項であって、実装にあっては分析を行った上でより適切ルールを策定すること。規約等は更新されている場合があるため、検討する際には最新ものであることを確認すること。  

## 3.1. FHIR BASE Securityへの考慮
---
実装者はFHIR BASEにある[FHIR Security](http://hl7.org/fhir/security.html)に規定にされている下記の項目に対して考慮し、要求項目には対応しなければならない **(SHALL)**。
- [Communications](http://hl7.org/fhir/R4/security.html#http)
- [Authentication](http://hl7.org/fhir/R4/security.html#authentication)
- [Authorization/Access Control](http://hl7.org/fhir/R4/security.html#authorization/access%20control)
- [Audit Logging](http://hl7.org/fhir/R4/security.html#audit%20logging)
- [Digital Signatures](http://hl7.org/fhir/R4/security.html#digital%20signatures)
- [Security Labels](http://hl7.org/fhir/R4/security-labels.html)
- [Narrative](http://hl7.org/fhir/R4/security.html#narrative)
## 3.2. JP CoreにおけるSecurity要件
---
### 3.2.1. 全般
- 対象となる施設は、厚生労働省の定める「[医療情報システムの安全管理に関するガイドライン第5.1版](https://www.mhlw.go.jp/stf/shingi/0000516275.html)」の第６章「情報システムの基本的な安全管理」にあるリスクマネジメントを実施しなければならない **(SHALL)**。併せてプライバシーマークやセキュリティリスクマネジメントシステム(ISMS)の認証を取得することが望ましい　**(SHOULD)**。
- セキュリティ監査にて正確な時刻を確立するためにタイムサーバを利用すること **(SHALL)**。タイムサーバは独立行政法人 情報通信研究機構(NiCT)もしくはそこから派生するタイムサーバを利用することが望ましい **(SHOULD)**。
- サーバの配置に際しては日本ネットワークセキュリティ協会(JNSA)の定める「[サーバールームに関する標準](https://www.jnsa.org/policy/surver_room.pdf)」を参考にし堅牢な環境を用意することが望ましい　**(SHOULD)**。
- システムで利用するOSやサーバソフトウエア、ミドルウエアに関するセキュリティリスクを注視し、必要によって適宜バージョンアップしなければならない **(SHALL)**。
- 監査証跡ログを採取し、特に個人情報の流出防止の観点より認証、個人情報へのアクセス、印刷およびデータエクスポートをするイベントは注意深く監視し不正利用等が発生していないかを確認すること **(SHALL)**。「[JAHISヘルスケア分野における監査証跡のメッセージ標準規約Ver.2.0](https://www.jahis.jp/standard/detail/id=136)」を参考にすること。
- ネットワークのセキュリティに関しては「[医療情報システムの安全管理に関するガイドライン第5.1版](https://www.mhlw.go.jp/stf/shingi/0000516275.html)」の第６章に従った基準を踏襲すること **(SHALL)** 
- 法令で定められた記名・押印が必要な書類を原本として電子保存する場合、厚生労働省の定める準拠性監査基準を満たす保健医療福祉分野PKI 認証局又は認定特定認証事業者等の発行する電子証明書を用いて電子署名を作成し電子署名を含む文書全体にタイムスタンプを付与すること。（厚生労働省の定める「医療情報システムの安全管理に関するガイドライン第5.1版」の6.12 章参照）**(SHALL)**。
### 3.2.2. クラウドでの利用
- 「外部保存改正通知」で定められた文書等をクラウドに保管する場合は、厚生労働省の定める「[医療情報システムの安全管理に関するガイドライン第5.1版](https://www.mhlw.go.jp/stf/shingi/0000516275.html)」の第８章「診療録及び診療諸記録を外部に保存する際の基準」の該当項目に対して準拠しなければならない **(SHALL)**。
- 利用するクラウドサービスの選定については、「[医療情報システムの安全管理に関するガイドライン第5.1版](https://www.mhlw.go.jp/stf/shingi/0000516275.html)」8.1.2.C.2の選定基準に従い、総務省・経済産業省の定めた「[医療情報を取り扱う情報システム・サービスの提供事業者における安全管理ガイドライン](http://www.soumu.go.jp/main_content/000567229.pdf)」を遵守することを契約等で明確に定め、少なくとも定期的に報告を受ける等で確認をすること。 **(SHALL)**。
