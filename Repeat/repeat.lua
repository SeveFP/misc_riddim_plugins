local word = "";
local word_n = 0;

riddim.plugins["repeat"] = function (bot)
        local function handler(message)
			local toRepeat = message.body
			if toRepeat then
				if word_n == 0 then
					word = toRepeat
					word_n = 1;
				else
					if word == toRepeat then
						word_n = word_n + 1
						if message.room and word_n == 2 then
							message.room:send_message(word)
							word = "";
							word_n = 0;
						end
					else
						word = "";
						word_n = 0
					end
				end
			end
        end
        bot:hook("message", handler);
        bot:hook("groupchat/joined", function(room)
                room:hook("message", handler)
        end);
end
