#Region Public

Procedure WriteChatHistory(User = Undefined, ChatData = Undefined) Export
	If ChatData = Undefined Then
		ChatDataTable = New ValueTable();
		ChatDataTable.Columns.Add("Role", New TypeDescription("String"));
		ChatDataTable.Columns.Add("Message", New TypeDescription("String"));
		ChatDataTable.Columns.Add("Predefined", New TypeDescription("Boolean"));
	Else
		ChatDataTable = ChatData.Unload();
	EndIf;
	
	If User = Undefined Then
		User = CommonClaudeAICached.GetCurrentUser();
	EndIf;
	
	ChatHistoryRecord = InformationRegisters.AIAssistantChatsHistory.CreateRecordManager();
	ChatHistoryRecord.User = User;
	ChatHistoryRecord.ChatHistory = New ValueStorage(ChatDataTable);
	ChatHistoryRecord.Write(True);
EndProcedure

#EndRegion