CodeSystem: EventStatus
Id: jp-core-work-codesystem-EventStatus
Title: "Procedureの状態"
* ^meta.versionId = "5"
* ^meta.lastUpdated = "2021-08-17T03:35:36.725+00:00"
* ^meta.source = "#AlLSIJB6Oq53LiNn"
* ^url = "https://hl7fhir.jp/fhir/ImplementationGuide/jp-core-work-codesystem-EventStatus"
* ^status = #draft
* ^content = #complete
* #preparation "Preparation" "コアイベントはまだ開始されていませんが、一部のステージングアクティビティが開始されています(e.gです。手術室準備)。準備段階は、請求目的のために追跡できます。"
* #in-progress "In Progress" "イベントは現在発生中です。"
* #not-done "Not Done" "イベントは準備ができないアクティビティの前に終了しました。I.eです。「メイン 」アクティビティはまだ開始されていません。準備活動と「メイン 」活動の境界は、状況に応じて異なります。"
* #on-hold "On Hold" "イベントは一時停止されていますが、今後再開される予定です。"
* #stopped "Stopped" "イベントは、意図したアクティビティーが完全に完了する前に終了しましたが、少なくとも一部の「メイン 」アクティビティー(準備ができていない)が発生した後に終了しました。"
* #completed "Completed" "イベントは終了しました。"
* #entered-in-error "Entered in Error" "この電子記録は存在すべきではなかったが、現実世界の決定がそれに基づいていた可能性はある。(実世界の活動が発生した場合、ステータスは「エラー入力」ではなく「停止」でなければなりません。)。"
* #unknown "Unknown" "オーサリング/ソースシステムでは、このイベントに現在適用されているステータス値がわかりません。注記:この概念は「その他」には使用されません。リストされているステータスのいずれかが適用されると想定されますが、オーサリングシステムとソースシステムはどちらに該当するかわかりません。"