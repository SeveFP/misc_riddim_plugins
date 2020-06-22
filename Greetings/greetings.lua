-- Maybe it could be extended with
-- some for every season, time of the day…
local greetings = {
  addressed = {
    "come in!",
    "welcome! :)",
    "all fine?",
    "nice to see you!",
    "hey.",
  },
  non_addressed = {
    "Knock, knock, somebody has joined!" ,
    "Hey everyone! Say hi!",
  }
}

function getGreeting(nick)
  math.randomseed(os.time())
  local result = math.random(2)
  if result % 2 == 0 then
    result = math.random(#greetings.addressed)
    return nick .. ": " .. greetings.addressed[result]
  else
    result = math.random(#greetings.non_addressed)
    return greetings.non_addressed[result]
  end
end

function riddim.plugins.greetings(bot)
	bot:hook("groupchat/joined", function (room)
		room:hook("occupant-joined", function (occupant)
		  room:send_message(getGreeting(occupant.nick))
		end);
	end);
end
