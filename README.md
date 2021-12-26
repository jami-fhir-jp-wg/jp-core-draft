# HL7 FHIR JP Core 実装ガイド ＜Draft Ver.1＞　　2021.12.26

---
Implementation Guideは、HL7®FHIR®標準を元に日本国内で患者データにアクセスするための最小限の適合性要件を定めたものである。日本国内での基底Implementation Guideとなることから、「JP Core Implementation Guide」(以下JP Core)と命名する。
日本国内の医療情報相互運用性規格としてはHL7v2.5規格があるが、FHIRはHL7v2.5への後方互換性を有していないことから、JP Coreも完全な後方互換性は備えていない。
JP Coreは「JAMI NeXEHRS課題研究会（正式名：次世代健康医療記録システム共通プラットホーム研究会）」に設置された「HL7 FHIR日本実装検討WG」において検討を行っているものである。


Copyright(C)2021-2021 by FHIR<sup>&reg;</sup> Japanese implementation research working group in Japan Association of Medical Informatics (JAMI). All rights reserved.
FHIR® is the registered trademark of HL7 and both FHIR and jpfhir.jp are used with the permission of HL7. Use of the FHIR trademark does not constitute endorsement of this product by HL7.

forSUSHIフォルダ内のinput.zipは、IGpublisherで作成するためのマークダウンファイルと、sushiコマンドで処理するためのFSHファイルである。sushiコマンドを実行するディレクトリのinputフォルダ内のFSHフォルダをこのファイルの内容と置き換えることでsushiコマンドはerrorなく実行できるはずである。ただし、ネーミングルールとの整合性から、warningは多数出るが実害はない。
マークダウンファイルの階層はまだ未整理で、このままではIGpublisher（_genonceスクリプト）で処理できるようにはなっていない。