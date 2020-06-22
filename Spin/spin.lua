local st = require "util.stanza";

function riddim.plugins.spin(bot)
        bot:hook("commands/spin", function (command)
		if command.param then
		  local options = {}
		  local stroptions = command.param:match('"(.-)"') .. ","
		  for i in stroptions:gmatch("(.-),") do
		    table.insert(options,i)
		  end
		  math.randomseed(os.time())
		  local replyStanza = st.reply(command.stanza);
		  command.room:send(replyStanza:body(options[math.random(#options)]))
		end

        end);
end

