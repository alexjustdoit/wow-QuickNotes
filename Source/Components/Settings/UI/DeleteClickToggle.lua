function NotepadSettings:_InitializeDeleteClickToggle()
	self.Frame.DeleteClickToggle = CreateFrame("CheckButton", "QN_Settings_DeleteClickToggle", self.Frame, "UICheckButtonTemplate")
	self.Frame.DeleteClickToggle:SetPoint("TOPLEFT", self.Frame, 14, -245)
	self.Frame.DeleteClickToggle.Text:SetText("Right-click to delete notes")
	self.Frame.DeleteClickToggle.Text:SetFontObject("GameFontNormal")

	self.Frame.DeleteClickToggle:SetChecked(self.deleteButton == "RightButton")
	self.Frame.DeleteClickToggle:SetScript("OnClick", function(button)
		self.deleteButton = button:GetChecked() and "RightButton" or "LeftButton"
		self:SaveSettings()
	end)

	self.Frame.DeleteClickDescription = self.Frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
	self.Frame.DeleteClickDescription:SetPoint("TOPLEFT", self.Frame, 45, -278)
	self.Frame.DeleteClickDescription:SetText("Off: left-click deletes. On: right-click deletes.")

	self.Frame.DeleteClickToggle:SetScript("OnEnter", function()
		GameTooltip:SetOwner(self.Frame.DeleteClickToggle, "ANCHOR_RIGHT")
		GameTooltip:SetText("Choose which mouse button deletes a note. Left-click is the default.", nil, nil, nil, nil, true)
		GameTooltip:Show()
	end)

	self.Frame.DeleteClickToggle:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
end
