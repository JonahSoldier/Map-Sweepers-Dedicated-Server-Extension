if not(engine.ActiveGamemode() == "mapsweepers") then return end
include("jcms_serverExt/shared.lua")

jcms.serverExtension_voteKickIndex = 1

hook.Add("OnChatTab", "jcms_serverExtension_chatTab_votekick", function(text)
	if not string.StartsWith(string.lower(text), "!votekick") then 
		return text 
	end

	local allPlys = player.GetAll()

	--not very readable. This increments and wraps around
	jcms.serverExtension_voteKickIndex = ((jcms.serverExtension_voteKickIndex) % #allPlys) + 1
	local ind = jcms.serverExtension_voteKickIndex

	local nick = allPlys[ind]:Nick()

	return "!votekick " .. nick
end)