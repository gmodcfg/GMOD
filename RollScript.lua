if(SERVER) then
	function roll(ply, text, public)
		if(string.StartWith(text, "!testroll") or string.StartWith(text, "/testroll")) then
			local Return = string.format("Vous avez obtenue %s", math.random( 1, 100))
			local ReturnAll = string.format("%s a obtenue %s", ply:Name(), math.random( 1, 100))

			ply:PrintMessage(4, Return)
			ply:ChatPrint(Return)
			
			ply:ChatPrint(string.format("Tu est a %s de distance de %s par rapport a toi qui a %s et %s", ply:GetLocalPos():Distance(v:GetLocalPos()), ply:Name(), v:GetLocalPos(), ply:GetLocalPos()))
	
			for k, v in pairs(player.GetAll()) do
				--if (v:Alive() and !v:Name() == ply:Name()) then
				if (v:Alive()) then
					v:ChatPrint(string.format("Tu est a %s de distance de %s par rapport a toi qui a %s et %s", ply:GetLocalPos():Distance(v:GetLocalPos()), ply:Name(), v:GetLocalPos(), ply:GetLocalPos()))
					print(ply:GetLocalPos():Distance(v:GetLocalPos()))
					if(ply:GetLocalPos():Distance(v:GetLocalPos()) <= 300) then
						v:ChatPrint(ReturnAll)
					end
				end
			end
		end
	end
	hook.Add("PlayerSay", "roll", roll)
end
if(CLIENT) then
	
end
