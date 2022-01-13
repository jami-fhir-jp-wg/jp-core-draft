Invariant: ref-1
Description: "SHALL have a contained resource if a local reference is provided"
Severity: #error
Expression: "reference.startsWith('#').not() or (reference.substring(1).trace('url') in %resource.contained.id.trace('ids'))"