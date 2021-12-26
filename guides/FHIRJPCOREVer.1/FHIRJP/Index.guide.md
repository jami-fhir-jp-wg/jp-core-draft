# HL7 FHIR JP Core 実装ガイド ＜Draft Ver.1＞　　2021.12.26

---
Copyright©2021 by FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI). All rights reserved.

このドキュメントは日本医療情報学会(JAMI) NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1 です。このバージョンは日本HL7協会による承認を受けていません。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。

Thie Implementation Guide is for defining minimum requirement and constrains of comformance based on HL7 FHIR specification to access health and healthcare information in Japan. This is named as "JP Core Implementation Guide" ( JP Core). JP Core is created and described through a lot of considerations and discussions in FHIR® Japanese implementation research working group under the Japan Association of Medical Informatics (JAMI). This version is only for public comments of Draft Version1 Release. Do not use for implementation of production operation system. Please use at your own risk and as it is.

### Packageのダウンロード： [【zip版】](https://jpfhir.jp/jpcoreV1/corePackages/jp-core-draft100v-diff.zip)  [【GitHUBへ】](https://github.com/jami-fhir-jp-wg/jp-core-draft.git)

### 概要
-   1. ガイダンス: JP Coreでの全体に関わる規則や注意事項を記載しています。
    - [1.1. 総合ガイダンス](GeneralGuidance)
    - [1.2. CardinaryとMust Supportの組み合わせ](Cardinality)
    - [1.3. 欠損値の扱い](Handlingofnon-existentdata)
    - [1.4. 文字コード](CharacterEncoding)
    - [1.5. 検索](Search)
##
 - 2. JP Core FHIRコンテンツ: JP Coreで利用するFHIRの詳細について記載をしています。
    - 2.1. Profiles （プロファイル）
        - 2.1.1. Administration （運営管理）
            - [2.1.1.1. JP Core Patient （患者）プロファイル](Patient)
            - [2.1.1.2. JP Core Coverage （保険・公費）プロファイル](Coverage)
            - [2.1.1.3. JP Core Encounter （来院・入院）プロファイル](Encounter)
            - [2.1.1.4. JP Core Location （所在場所）プロファイル](Location)
            - [2.1.1.5. JP Core Organization （組織）プロファイル](Organization)
            - [2.1.1.6. JP Core Practitioner （医療従事者）プロファイル](Practitioner)
            - [2.1.1.7. JP Core PractitionerRole （医療従事者役割)プロファイル](PractitionerRole)
        - 2.1.2. Medication （薬剤リスト）
            - [2.1.2.1. JP Core Medication （薬剤）プロファイル](Medication)
            - [2.1.2.2. JP Core MedicationRequest （内服・外用薬剤処方）プロファイル](MedicationRequest)
            - [2.1.2.3. JP Core MedicationRequest Injection （注射薬剤処方）プロファイル](MedicationRequest2)
            - [2.1.2.4. JP Core MedicationDispense （内服・外用薬剤処方調剤・払い出し記録）プロファイル](MedicationDispense)
            - [2.1.2.5. JP Core MedicationDispense Injection （注射薬剤処方調剤・払い出し記録）プロファイル](MedicationDispense2)
            - [2.1.2.6. JP Core MedicationAdministration （内服・外用薬剤投与実施情報）プロファイル](MedicationAdministration)
            - [2.1.2.7. JP Core MedicationAdministration Injection （注射薬剤投与実施情報）プロファイル](MedicationAdministration2)
        - 2.1.3. Diagnostic （診断）
            - 2.1.3.1. Observation （検査）
                - [2.1.3.1.0. JP Core Observation Common （共通）プロファイル](ObservationCommon)
                - [2.1.3.1.1. JP Core Observation LabResult （検体検査結果）プロファイル](ObservationLabResult)
                - [2.1.3.1.2. JP Core Observation VitalSigns （バイタルサイン）プロファイル](ObservationVitalSigns)
                - [2.1.3.1.3. JP Core Observation BodyMeasurement （身体計測）プロファイル](ObservationBodyMeasurement)
                - [2.1.3.1.4. JP Core Observation PhysicalExam （身体所見）プロファイル](ObservationPhysicalExam)
                - [2.1.3.1.5. JP Core Observation SocialHistory （生活背景）プロファイル](ObservationSocialHistory)
            - 2.1.3.2. ImagingStudy （画像検査）
                - [2.1.3.2.1. JP Core ImagingStudy Radiology（放射線検査）プロファイル](ImagingStudyRadiology)
            - 2.1.3.3. DiagnosticReport （診断レポート)
                - [2.1.3.3.0. JP Core DiagnosticReport Common （共通）プロファイル](DiagnosticReportCommon)
                - [2.1.3.3.1. JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル](DiagnosticReportLabResult)
                - [2.1.3.3.2. JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル](DiagnosticReportRadiology2)
        - 2.1.4. Clinical （診療）
            - [2.1.4.1. JP Core AllergyIntolerance （アレルギー・不耐症）プロファイル](Allergy)
            - [2.1.4.2. JP Core Condition （状態）プロファイル](Condition)
            - [2.1.4.3. JP Core Procedure （処置）プロファイル](Procedure)
    - [2.2. Extensions （拡張）](Extensions): Profilesにて利用されるExtensionをまとめています。

    - [2.3. Operations and Search Parameters （操作および検索パラメータ）](OperationsAndSearchParameters): Profilesにて利用されるSearch Parameter および Operationをまとめています。
    - [2.4. Terminology （用語集）](Terminology)
    - 2.5. CapabilityStatements （機能宣言）
        - [2.5.1. JP Core Server Capability Statement](ServerCapabilityStatement)
        - [2.5.2. JP Core Client Capability Statement](ClientCapabilityStatement)
- [3. Security （セキュリティ）](Security): セキュリティに関する要件を記載しています。

---


