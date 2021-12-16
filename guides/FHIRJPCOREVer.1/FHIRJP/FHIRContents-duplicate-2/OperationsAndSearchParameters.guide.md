このドキュメントはHL7 FHIR実装ワーキンググループで作業中有の実装ガイドです。日本HL7協会が承認するものではありませんので、実装や利用は全て自己責任で行ってください。

# 2.3. Operations and Search Parameters 
---

## 2.3.1. Operations
JP Coreにて追加定義されたOperationsはない。

## 2.3.2. Search Parameters
注：このセクションでは、検索機能を定義するためのCapablity Statement内で使用される検索パラメータの定義を示している。ここではクライアントまたはサーバーに対する検索要件を表すものではないことに注意すること。

### 2.3.2.1. Patient
* identifier ({{link:jp-core-draftv1/jp-core-patient-identifier}})
* name ({{link:jp-core-draftv1/jp-core-patient-name}})
* family ({{link:jp-core-draftv1/jp-core-patient-family}})
* given ({{link:jp-core-draftv1/jp-core-patient-given}}))
* birthdate ({{link:jp-core-draftv1/jp-core-patient-birthdate}})
* gender ({{link:jp-core-draftv1/jp-core-patient-gender}})
* phone ({{link:jp-core-draftv1/jp-core-patient-phone}})
* postalcode ({{link:jp-core-draftv1/jp-core-patient-address-postalcode}})

### 2.3.2.2. Coverage
* identifier({{link:jp-core-draftv1/jp-core-coverage-identifier}})
* beneficiary({{link:jp-core-draftv1/jp-core-coverage-beneficiary}})

### 2.3.2.3. Encounter
* class({{link:jp-core-draftv1/jp-core-encounter-class}})
* date({{link:jp-core-draftv1/jp-core-encounter-date}})
* identifier({{link:jp-core-draftv1/jp-core-encounter-identifier}})
* patient({{link:jp-core-draftv1/jp-core-encounter-patient}})
* status({{link:jp-core-draftv1/jp-core-encounter-status}})
* type({{link:jp-core-draftv1/jp-core-encounter-type}})

### 2.3.2.4. Location
* name({{link:jp-core-draftv1/jp-core-location-name}})
* address({{link:jp-core-draftv1/jp-core-location-address}})
* address-city({{link:jp-core-draftv1/jp-core-location-address-city}})
* address-state({{link:jp-core-draftv1/jp-core-location-address-state}})
* address-postalcode({{link:jp-core-draftv1/jp-core-location-address-postalcode}})

### 2.3.2.5. Organization
* identifier({{link:jp-core-draftv1/jp-core-organization-identifier}})
* name({{link:jp-core-draftv1/jp-core-organization-name}})
* address({{link:jp-core-draftv1/jp-core-organization-address}})

### 2.3.2.6. Practitioner
* name({{link:jp-core-draftv1/jp-core-practitioner-name}})
* identifier({{link:jp-core-draftv1/jp-core-practitioner-identifier}})

### 2.3.2.7. PractitionerRole
* specialty({{link:jp-core-draftv1/jp-core-practitionerrole-specialty}})
* practitioner({{link:jp-core-draftv1/jp-core-practitionerrole-practitioner}})

### 2.3.2.8. Medication
なし

### 2.3.2.9. MedicationRequest
* identifier({{link:jp-core-draftv1/jp-core-medicationrequest-identifier}})
* patient({{link:jp-core-draftv1/jp-core-medicationrequest-patient}})
* authoredon({{link:jp-core-draftv1/jp-core-medicationrequest-authoredon}})
* date({{link:jp-core-draftv1/jp-core-medicationrequest-date}})
* category({{link:jp-core-draftv1/jp-core-medicationrequest-category}})
* code({{link:jp-core-draftv1/jp-core-medicationrequest-code}})
* requester({{link:jp-core-draftv1/jp-core-medicationrequest-requester}})

### 2.3.2.10. MedicationDispense
* identifier({{link:jp-core-draftv1/jp-core-medicationdispense-identifier}})
* patient({{link:jp-core-draftv1/jp-core-medicationdispense-patient}})
* whenhandedover({{link:jp-core-draftv1/jp-core-medicationdispense-whenhandedover}})
* whenprepared({{link:jp-core-draftv1/jp-core-medicationdispense-whenprepared}})
* encounter ({{link:jp-core-draftv1/jp-core-medicationdispense-encounter}})
* code({{link:jp-core-draftv1/jp-core-medicationdispense-code}})
* performer({{link:jp-core-draftv1/jp-core-medicationdispense-performer}})

### 2.3.2.11. MedicationAdministration
* identifier({{link:jp-core-draftv1/jp-core-medicationadministration-identifier}})
* patient({{link:jp-core-draftv1/jp-core-medicationadministration-patient}})
* effectivedatetime({{link:jp-core-draftv1/jp-core-medicationadministration-effectivedatetime}})
* code({{link:jp-core-draftv1/jp-core-medicationadministration-code}})

### 2.3.2.12. Observation
* patient({{link:jp-core-draftv1/jp-core-observation-patient}})
* category({{link:jp-core-draftv1/jp-core-observation-category}})
* code({{link:jp-core-draftv1/jp-core-observation-code}})
* date({{link:jp-core-draftv1/jp-core-observation-date}})
* encounter({{link:jp-core-draftv1/jp-core-observation-encounter}})
* value-quantity({{link:jp-core-draftv1/jp-core-observation-value-quantity}})
* value-concept({{link:jp-core-draftv1/jp-core-observation-value-concept}})
* servicerequest({{link:jp-core-draftv1/jp-core-observation-servicerequest}})

### 2.3.2.13. ImagingStudy
* Patient({{link:jp-core-draftv1/jp-core-imagingstudy-patient}})
* modality({{link:jp-core-draftv1/jp-core-imagingstudy-modality}})
* bodysite({{link:jp-core-draftv1/jp-core-imagingstudy-bodysite}})
* started({{link:jp-core-draftv1/jp-core-imagingstudy-started}})
* encounter({{link:jp-core-draftv1/jp-core-imagingstudy-encounter}})

### 2.3.2.14. DiagnosticReport
* patient({{link:jp-core-draftv1/jp-core-diagnosticreport-patient}})
* category({{link:jp-core-draftv1/jp-core-diagnosticreport-category}})
* code({{link:jp-core-draftv1/jp-core-diagnosticreport-code}})
* date({{link:jp-core-draftv1/jp-core-diagnosticreport-date}})
* servicerequest({{link:jp-core-draftv1/jp-core-diagnosticreport-servicerequest}})

### 2.3.2.15. AllergyIntolerance
* patient({{link:jp-core-draftv1/jp-core-allergyintolerance-patient}})
* clinicalstatus({{link:jp-core-draftv1/jp-core-allergyintolerance-clinicalstatus}})
* date({{link:jp-core-draftv1/jp-core-allergyintolerance-date}})
* type({{link:jp-core-draftv1/jp-core-allergyintolerance-type}})
* category({{link:jp-core-draftv1/jp-core-allergyintolerance-category}})
* verificationstatus({{link:jp-core-draftv1/jp-core-allergyintolerance-verificationstatus}})
* criticality({{link:jp-core-draftv1/jp-core-allergyintolerance-criticality}})

### 2.3.2.16. Condition
* patient({{link:jp-core-draftv1/jp-core-condition-patient}})
* clinicalstatus({{link:jp-core-draftv1/jp-core-condition-clinicalstatus}})
* date({{link:jp-core-draftv1/jp-core-condition-date}})
* category({{link:jp-core-draftv1/jp-core-condition-category}})
* verificationstatus({{link:jp-core-draftv1/jp-core-condition-verificationstatus}})

### 2.3.2.17. Procedure
* patient({{link:jp-core-draftv1/jp-core-procedure-patient}})
* date({{link:jp-core-draftv1/jp-core-procedure-date}})
