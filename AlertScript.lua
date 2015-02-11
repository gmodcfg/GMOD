if (SERVER) then
	function Commands(ply, text, team)	
		if(string.StartWith(text, "!alert") or string.StartWith(text, "/alert")) then
			if(ply:IsAdmin() or ply:IsSuperAdmin()) then						
				umsg.Start("openadminalert", ply)
				umsg.End()
			end
		end
		
	end

	hook.Add('PlayerSay', "commands", Commands)
	
	function ConAlert(ply, cmd, args)
		if(ply:IsAdmin() or ply:IsSuperAdmin()) then						
			local ReturnText = string.format("Message de %s : %s", ply:Name(), args[1])
			for k, v in pairs( player.GetAll() ) do
				v:PrintMessage(4, ReturnText)
				v:ChatPrint(ReturnText)
			end
		end
	end
	concommand.Add("alert", ConAlert)
end

if(CLIENT) then
	local function OpenAlertPanel()
		local Frame = vgui.Create("DFrame")
		Frame:SetPos(ScrW()/2 - 200, ScrH()/2 - 100) 
		Frame:SetSize(400, 100) 
		Frame:SetTitle("Admin Alert") 
		Frame:SetVisible(true) 
		Frame:SetDraggable(false) 
		Frame:ShowCloseButton(true) 
		Frame:MakePopup()
		
		local TextEntry = vgui.Create("DTextEntry", Frame )
		TextEntry:SetPos(25, 45)
		TextEntry:SetSize(350, 30)
		TextEntry:SetText("Votre message a envoyer")
		TextEntry.OnEnter = function( self )
			RunConsoleCommand("alert", self:GetValue())
			Frame:Close()
		end
	end
	usermessage.Hook("openadminalert", OpenAlertPanel)
end
