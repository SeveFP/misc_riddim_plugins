local st = require "util.stanza";

function riddim.plugins.here(bot)
        bot:hook("commands/here", function (command)
		local stroccupants = ""
		for k, v in pairs(command.room.occupants) do
		  stroccupants = stroccupants .. k .. ", "
		end
		local replyStanza = st.reply(command.stanza);
		command.room:send(replyStanza:body(stroccupants:sub(1, stroccupants:len()-2) .. "."))
        end);
end
