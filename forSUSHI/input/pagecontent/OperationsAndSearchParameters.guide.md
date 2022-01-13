このドキュメントはHL7 FHIR実装ワーキンググループで作業中有の実装ガイドです。日本HL7協会が承認するものではありませんので、実装や利用は全て自己責任で行ってください。

# 2.3. Operations and Search Parameters 
---

## 2.3.1. Operations
JP Coreにて追加定義されたOperationsはない。

## 2.3.2. Search Parameters
注：このセクションでは、検索機能を定義するためのCapablity Statement内で使用される検索パラメータの定義を示している。ここではクライアントまたはサーバーに対する検索要件を表すものではないことに注意すること。

### 2.3.2.1. Patient
* identifier ({{link:jp-core-patient-identifier}})
* name ({{link:jp-core-patient-name}})
* family ({{link:jp-core-patient-family}})
* given ({{link:jp-core-patient-given}}))
* birthdate ({{link:jp-core-patient-birthdate}})
* gender ({{link:jp-core-patient-gender}})
* phone ({{link:jp-core-patient-phone}})
* address-postalcode ({{link:jp-core-patient-address-postalcode}})

### 2.3.2.2. Coverage
* beneficiary({{link:jp-core-coverage-beneficiary}})
* class-type({{link:jpcore/jp-core-coverage-class-type}})
* class-value({{link:jpcore/jp-core-coverage-class-value}})
* dependent({{link:jpcore/jp-core-coverage-dependent}})
* identifier({{link:jp-core-coverage-identifier}})
* patient({{link:jpcore/jp-core-coverage-patient}})
* payor({{link:jpcore/jp-core-coverage-payor}})
* policy-holder({{link:jpcore/jp-core-coverage-policy-holder}})
* status({{link:jpcore/jp-core-coverage-status}})
* subscriber({{link:jpcore/jp-core-coverage-subscriber}})
* type({{link:jpcore/jp-core-coverage-type}})

### 2.3.2.3. Encounter
* class({{link:jp-core-encounter-class}})
* date({{link:jp-core-encounter-date}})
* identifier({{link:jp-core-encounter-identifier}})
* patient({{link:jp-core-encounter-patient}})
* status({{link:jp-core-encounter-status}})
* type({{link:jp-core-encounter-type}})

### 2.3.2.4. Location
* name({{link:jp-core-location-name}})
* address({{link:jp-core-location-address}})
* address-city({{link:jp-core-location-address-city}})
* address-state({{link:jp-core-location-address-state}})
* address-postalcode({{link:jp-core-location-address-postalcode}})

### 2.3.2.5. Organization
* identifier({{link:jp-core-organization-identifier}})
* name({{link:jp-core-organization-name}})
* address({{link:jp-core-organization-address}})

### 2.3.2.6. Practitioner
* name({{link:jp-core-practitioner-name}})
* identifier({{link:jp-core-practitioner-identifier}})

### 2.3.2.7. PractitionerRole
* specialty({{link:jp-core-practitionerrole-specialty}})
* practitioner({{link:jp-core-practitionerrole-practitioner}})

### 2.3.2.8. Medication
なし

### 2.3.2.9. MedicationRequest
* identifier({{link:jp-core-medicationrequest-identifier}})
* patient({{link:jp-core-medicationrequest-patient}})
* authoredon({{link:jp-core-medicationrequest-authoredon}})
* date({{link:jp-core-medicationrequest-date}})
* category({{link:jp-core-medicationrequest-category}})
* code({{link:jp-core-medicationrequest-code}})
* requester({{link:jp-core-medicationrequest-requester}})

### 2.3.2.10. MedicationDispense
* identifier({{link:jp-core-medicationdispense-identifier}})
* patient({{link:jp-core-medicationdispense-patient}})
* whenhandedover({{link:jp-core-medicationdispense-whenhandedover}})
* whenprepared({{link:jp-core-medicationdispense-whenprepared}})
* context ({{link:jp-core-medicationdispense-context}})
* code({{link:jp-core-medicationdispense-code}})
* performer({{link:jp-core-medicationdispense-performer}})

### 2.3.2.11. MedicationAdministration
* identifier({{link:jp-core-medicationadministration-identifier}})
* patient({{link:jp-core-medicationadministration-patient}})
* effective-time({{link:jp-core-medicationadministration-effective-time}})
* code({{link:jp-core-medicationadministration-code}})

### 2.3.2.12. Observation
* patient({{link:jp-core-observation-patient}})
* category({{link:jp-core-observation-category}})
* code({{link:jp-core-observation-code}})
* date({{link:jp-core-observation-date}})
* encounter({{link:jp-core-observation-encounter}})
* value-quantity({{link:jp-core-observation-value-quantity}})
* value-concept({{link:jp-core-observation-value-concept}})
* based-on({{link:jpcore/jp-core-observation-based-on}})

### 2.3.2.13. ImagingStudy
* patient({{link:jp-core-imagingstudy-patient}})
* modality({{link:jp-core-imagingstudy-modality}})
* bodysite({{link:jp-core-imagingstudy-bodysite}})
* started({{link:jp-core-imagingstudy-started}})
* encounter({{link:jp-core-imagingstudy-encounter}})

### 2.3.2.14. DiagnosticReport
* patient({{link:jp-core-diagnosticreport-patient}})
* category({{link:jp-core-diagnosticreport-category}})
* code({{link:jp-core-diagnosticreport-code}})
* date({{link:jp-core-diagnosticreport-date}})
* based-on({{link:jpcore/jp-core-diagnosticreport-based-on}})

### 2.3.2.15. AllergyIntolerance
* patient({{link:jp-core-allergyintolerance-patient}})
* clinical-status({{link:jpcore/jp-core-allergyintolerance-clinical-status}})
* date({{link:jp-core-allergyintolerance-date}})
* type({{link:jp-core-allergyintolerance-type}})
* category({{link:jp-core-allergyintolerance-category}})
* verification-status({{link:jpcore/jp-core-allergyintolerance-verification-status}})
* criticality({{link:jp-core-allergyintolerance-criticality}})

### 2.3.2.16. Condition
* patient({{link:jp-core-condition-patient}})
* clinical-status({{link:jpcore/jp-core-condition-clinical-status}})
* onset-date({{link:jpcore/jp-core-condition-onset-date}})
* category({{link:jp-core-condition-category}})
* verification-status({{link:jpcore/jp-core-condition-verification-status}})

### 2.3.2.17. Procedure
* patient({{link:jp-core-procedure-patient}})
* date({{link:jp-core-procedure-date}})
