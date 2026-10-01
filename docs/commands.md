# Command reference

Auto-generated from the installed cogs by `tools/command_reference.py` on 2026-10-01.

**458 commands across 19 cogs.** Prefix is `!` (shown as-is).

`!help` and `!help <command>` are always available (Red's help command) and are not listed per-cog below.

## admin (19)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!addrole <rolename> [user=<you>]` | — | Add a role to a user. |
| `!removerole <rolename> [user=<you>]` | — | Remove a role from a user. |
| `!editrole` | — | Edit role settings. |
| `!editrole name <role> <name>` | — | Edit a role's name. |
| `!editrole colour <role> <value>` | `color` | Edit a role's colour. |
| `!announce <message>` | — | Announce a message to all servers the bot is in. |
| `!announce cancel` | — | Cancel a running announce. |
| `!announceset` | — | Change how announcements are sent in this guild. |
| `!announceset channel <channel>` | — | Change the channel where the bot will send announcements. |
| `!announceset clearchannel` | — | Unsets the channel for announcements. |
| `!selfrole <selfrole>` | — | Add or remove a selfrole from yourself. |
| `!selfrole add <selfrole>` | — | Add a selfrole to yourself. |
| `!selfrole list` | — | Lists all available selfroles. |
| `!selfrole remove <selfrole>` | — | Remove a selfrole from yourself. |
| `!selfroleset` | — | Manage selfroles. |
| `!selfroleset remove <roles...>` | — | Remove a role, or a selection of roles, from the list of available selfroles. |
| `!selfroleset add <roles...>` | — | Add a role, or a selection of roles, to the list of available selfroles. |
| `!selfroleset clear` | — | Clear the list of available selfroles for this server. |
| `!serverlock` | — | Lock a bot to its current servers only. |

## alias (12)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!alias` | — | Manage command aliases. |
| `!alias list` | — | List the available aliases on this server. |
| `!alias global` | — | Manage global aliases. |
| `!alias global delete <alias_name>` | `del`, `remove` | Delete an existing global alias. |
| `!alias global add <alias_name> <command>` | — | Add a global alias for a command. |
| `!alias global list` | — | List the available global aliases on this bot. |
| `!alias global edit <alias_name> <command>` | — | Edit an existing global alias. |
| `!alias show <alias_name>` | — | Show what command the alias executes. |
| `!alias add <alias_name> <command>` | — | Add an alias for a command. |
| `!alias help <alias_name>` | — | Try to execute help for the base command of the alias. |
| `!alias delete <alias_name>` | `del`, `remove` | Delete an existing alias on this server. |
| `!alias edit <alias_name> <command>` | — | Edit an existing alias in this server. |

## cleanup (12)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!cleanup` | — | Base command for deleting messages. |
| `!cleanup after [message_id] [delete_pinned=False]` | — | Delete all messages after a specified message. |
| `!cleanup text <text> <number> [delete_pinned=False]` | — | Delete the last X messages matching the specified text in the current channel. |
| `!cleanup user <user> <number> [delete_pinned=False]` | — | Delete the last X messages from a specified user in the current channel. |
| `!cleanup before [message_id] <number> [delete_pinned=False]` | — | Deletes X messages before the specified message. |
| `!cleanup messages <number> [delete_pinned=False]` | — | Delete the last X messages in the current channel. |
| `!cleanup duplicates [number=50]` | `spam` | Deletes duplicate messages in the channel from the last X messages and keeps only one copy. |
| `!cleanup self <number> [match_pattern] [delete_pinned=False]` | — | Clean up messages owned by the bot in the current channel. |
| `!cleanup bot <number> [delete_pinned=False]` | — | Clean up command messages and messages from the bot in the current channel. |
| `!cleanup between <one> <two> [delete_pinned=False]` | — | Delete the messages between Message One and Message Two, providing the messages IDs. |
| `!cleanupset` | — | Manage the settings for the cleanup command. |
| `!cleanupset notify` | — | Toggle clean up notification settings. |

## customcom (11)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!customcom` | `cc` | Base command for Custom Commands management. |
| `!customcom raw <command>` | — | Get the raw response of a custom command, to get the proper markdown. |
| `!customcom search <query>` | — | Searches through custom commands, according to the query. |
| `!customcom delete <command>` | `del`, `remove` | Delete a custom command. |
| `!customcom show <command_name>` | — | Shows a custom command's responses and its settings. |
| `!customcom create <command> <text>` | `add` | Create custom commands. |
| `!customcom create simple <command> <text>` | — | Add a simple custom command. |
| `!customcom create random <command>` | — | Create a CC where it will randomly choose a response! |
| `!customcom list` | — | List all available custom commands. |
| `!customcom edit <command> [text]` | — | Edit a custom command. |
| `!customcom cooldown <command> [cooldown] [per=member]` | — | Set, edit, or view the cooldown for a custom command. |

## downloader (22)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!pipinstall <deps...>` | — | Install a group of dependencies using pip. |
| `!repo` | — | Base command for repository management. |
| `!repo info <repo>` | — | Show information about a repo. |
| `!repo delete <repos...>` | `remove`, `del` | Remove repos and their files. |
| `!repo update [repos...]` | — | Update all repos, or ones of your choosing. |
| `!repo list` | — | List all installed repos. |
| `!repo add <name> <repo_url> [branch]` | — | Add a new repo. |
| `!cog` | — | Base command for cog installation management commands. |
| `!cog uninstall <cogs...>` | — | Uninstall cogs. |
| `!cog update [reload] [cogs...]` | — | Update all cogs, or ones of your choosing. |
| `!cog listpinned` | — | List currently pinned cogs. |
| `!cog install <repo> <cogs...>` | — | Install a cog from the given repo. |
| `!cog reinstallreqs` | — | This command should not be used unless Red specifically asks for it. |
| `!cog info <repo> <cog>` | — | List information about a single cog. |
| `!cog unpin <cogs...>` | — | Unpin cogs - this will remove the update lock from those cogs. |
| `!cog installversion <repo> <revision> <cogs...>` | — | Install a cog from the specified revision of given repo. |
| `!cog checkforupdates` | — | Check for available cog updates (including pinned cogs). |
| `!cog updateallfromrepos [reload] <repos...>` | — | Update all cogs from repos of your choosing. |
| `!cog list <repo>` | — | List all available cogs from a single repo. |
| `!cog pin <cogs...>` | — | Pin cogs - this will lock cogs on their current version. |
| `!cog updatetoversion [reload] <repo> <revision> [cogs...]` | — | Update all cogs, or ones of your choosing to chosen revision of one repo. |
| `!findcog <command_name>` | — | Find which cog a command comes from. |

## economy (16)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!bank` | — | Base command to manage the bank. |
| `!bank balance [user=<you>]` | — | Show the user's account balance. |
| `!bank transfer <to> <amount>` | — | Transfer currency to other users. |
| `!bank set <to> <creds>` | — | Set the balance of a user's bank account. |
| `!payday` | — | Get some free currency. |
| `!leaderboard [top=10] [show_global=False]` | — | Print the leaderboard. |
| `!payouts` | — | Show the payouts for the slot machine. |
| `!slot <bid>` | — | Use the slot machine. |
| `!economyset` | — | Base command to manage Economy settings. |
| `!economyset slotmax <bid>` | — | Set the maximum slot machine bid. |
| `!economyset paydayamount <creds>` | — | Set the amount earned each payday. |
| `!economyset rolepaydayamount <role> <creds>` | — | Set the amount earned each payday for a role. |
| `!economyset showsettings` | — | Shows the current economy settings |
| `!economyset slotmin <bid>` | — | Set the minimum slot machine bid. |
| `!economyset paydaytime <duration>` | — | Set the cooldown for the payday command. |
| `!economyset slottime <duration>` | — | Set the cooldown for the slot machine. |

## filter (14)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!filterset` | — | Base command to manage filter settings. |
| `!filterset defaultname <name>` | — | Set the nickname for users with a filtered name. |
| `!filterset ban <count> <timeframe>` | — | Set the filter's autoban conditions. |
| `!filter` | — | Base command to add or remove words from the server filter. |
| `!filter channel` | — | Base command to add or remove words from the channel filter. |
| `!filter channel list` | — | Send a list of the channel's filtered words. |
| `!filter channel add <channel> <words...>` | — | Add words to the filter. |
| `!filter channel clear` | — | Clears this channel's filter list. |
| `!filter channel delete <channel> <words...>` | `remove`, `del` | Remove words from the filter. |
| `!filter names` | — | Toggle name and nickname filtering. |
| `!filter delete <words...>` | `remove`, `del` | Remove words from the filter. |
| `!filter list` | — | Send a list of this server's filtered words. |
| `!filter add <words...>` | — | Add words to the filter. |
| `!filter clear` | — | Clears this server's filter list. |

## general (10)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!choose <first> <second> [others...]` | — | Choose between multiple options. |
| `!roll [number=100]` | — | Roll a random number. |
| `!flip [user]` | — | Flip a coin... or a user. |
| `!rps <your_choice>` | — | Play Rock Paper Scissors. |
| `!8 <question>` | `8ball` | Ask 8 ball a question. |
| `!stopwatch` | `sw` | Start or stop the stopwatch. |
| `!lmgtfy <search_terms>` | — | Create a lmgtfy link. |
| `!hug <user> [intensity=1]` | — | Because everyone likes hugs! |
| `!serverinfo [details=False]` | — | Show server information. |
| `!urban <word>` | — | Search the Urban Dictionary. |

## image (7)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!imgur` | — | Retrieve pictures from Imgur. |
| `!imgur subreddit <subreddit> [count=1] [sort_type=top] [window=day]` | — | Get images from a subreddit. |
| `!imgur search [count] <terms...>` | — | Search Imgur for the specified term. |
| `!imgurcreds` | — | Explain how to set imgur API tokens. |
| `!gif <keywords...>` | — | Retrieve the first search result from Giphy. |
| `!gifr <keywords...>` | — | Retrieve a random GIF from a Giphy search. |
| `!giphycreds` | — | Explains how to set GIPHY API tokens. |

## mod (36)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!slowmode [interval=0:00:00]` | — | Changes thread's or text channel's slowmode setting. |
| `!rename <member> [nickname]` | — | Change a member's server nickname. |
| `!userinfo [member]` | — | Show information about a member. |
| `!names <member>` | — | Show previous usernames, global display names, and server nicknames of a member. |
| `!kick <member> [reason]` | — | Kick a user. |
| `!ban <user> [days] [reason]` | — | Ban a user from this server and optionally delete days of messages. |
| `!massban <user_ids...> [days] [reason]` | `hackban` | Mass bans user(s) from the server. |
| `!tempban <member> [duration] [days] [reason]` | — | Temporarily ban a user from this server. |
| `!softban <member> [reason]` | — | Kick a user and delete 1 day's worth of their messages. |
| `!voicekick <member> [reason]` | — | Kick a member from a voice channel. |
| `!voiceunban <member> [reason]` | — | Unban a user from speaking and listening in the server's voice channels. |
| `!voiceban <member> [reason]` | — | Ban a user from speaking and listening in the server's voice channels. |
| `!unban <user_id> [reason]` | — | Unban a user from this server. |
| `!modset` | — | Manage server administration settings. |
| `!modset defaultduration <duration>` | — | Set the default time to be used when a user is tempbanned. |
| `!modset dm` | — | Settings for messaging the user when being kicked or banned. |
| `!modset dm sendmessage [enabled]` | — | Toggle whether a message should be sent to a user when they are kicked/banned. |
| `!modset dm banextrafieldtitle <title>` | — | Set the title for the optional extra embed on ban. |
| `!modset dm banshowextrafield [enabled]` | — | Toggle whether to show an extra customizable field when banning. |
| `!modset dm banextrafieldcontents <contents>` | — | Set the contents for the optional extra embed on ban |
| `!modset showsettings` | — | Show the current server administration settings. |
| `!modset requirereason [enabled]` | — | Toggle whether a reason is required for mod actions. |
| `!modset defaultdays [days=0]` | — | Set the default number of days worth of messages to be deleted when a user is banned. |
| `!modset deletenames [confirmation=False]` | — | Delete all stored usernames, global display names, and server nicknames. |
| `!modset deleterepeats [repeats]` | — | Enable auto-deletion of repeated messages. |
| `!modset reinvite` | — | Toggle whether an invite will be sent to a user when unbanned. |
| `!modset tracknicknames [enabled]` | — | Toggle whether server nickname changes should be tracked. |
| `!modset trackallnames [enabled]` | — | Toggle whether all name changes should be tracked. |
| `!modset mentionspam` | — | Manage the automoderation settings for mentionspam. |
| `!modset mentionspam kick <max_mentions>` | — | Sets the autokick conditions for mention spam. |
| `!modset mentionspam ban <max_mentions>` | — | Set the autoban conditions for mention spam. |
| `!modset mentionspam strict [enabled]` | — | Setting to account for duplicate mentions. |
| `!modset mentionspam warn <max_mentions>` | — | Sets the autowarn conditions for mention spam. |
| `!modset hierarchy` | — | Toggle role hierarchy check for mods and admins. |
| `!moveignoredchannels` | — | Move ignored channels and servers to core |
| `!movedeletedelay` | — | Move deletedelay settings to core |

## modlog (4)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!case <number>` | — | Show the specified case. |
| `!casesfor <member>` | — | Display cases for the specified member. |
| `!listcases <member>` | — | List cases for the specified member. |
| `!reason [case] <reason>` | — | Specify a reason for a modlog case. |

## mutes (17)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!voicemute <users...> [reason]` | — | Mute a user in their current voice channel. |
| `!voiceunmute <users...> [reason]` | — | Unmute a user in their current voice channel. |
| `!muteset` | — | Mute settings. |
| `!muteset notification [channel]` | — | Set the notification channel for automatic unmute issues. |
| `!muteset defaulttime [time]` | `time` | Set the default mute time for the mute command. |
| `!muteset makerole <name>` | — | Create a Muted role. |
| `!muteset role [role]` | — | Sets the role to be applied when muting a user. |
| `!muteset senddm <true_or_false>` | — | Set whether mute notifications should be sent to users in DMs. |
| `!muteset showmoderator <true_or_false>` | — | Decide whether the name of the moderator muting a user should be included in the DM to that user. |
| `!muteset settings` | `showsettings` | Shows the current mute settings for this guild. |
| `!activemutes` | — | Displays active mutes on this server. |
| `!timeout <users...> [time_and_reason]` | — | Timeout users. |
| `!mute <users...> [time_and_reason]` | — | Mute users. |
| `!mutechannel <users...> [time_and_reason]` | `channelmute` | Mute a user in the current text channel (or in the parent of the current thread). |
| `!unmute <users...> [reason]` | — | Unmute users. |
| `!forceunmute <users...> [reason]` | — | Force Unmute users who have had channel overwrite mutes in every channel. |
| `!unmutechannel <users...> [reason]` | `channelunmute` | Unmute a user in this channel (or in the parent of this thread). |

## permissions (19)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!permissions` | — | Command permission management tools. |
| `!permissions removeglobalrule <cog_or_command> <who_or_what...>` | — | Remove a global rule from a command. |
| `!permissions addserverrule <allow_or_deny> <cog_or_command> <who_or_what...>` | `addguildrule` | Add a rule to a command in this server. |
| `!permissions acl` | `yaml` | Manage permissions with YAML files. |
| `!permissions acl getglobal` | — | Get a YAML file detailing all global rules. |
| `!permissions acl setserver` | `setguild` | Set rules for this server with a YAML file. |
| `!permissions acl setglobal` | — | Set global rules with a YAML file. |
| `!permissions acl updateserver` | `updateguild` | Update rules for this server with a YAML file. |
| `!permissions acl yamlexample` | — | Sends an example of the yaml layout for permissions |
| `!permissions acl updateglobal` | — | Update global rules with a YAML file. |
| `!permissions acl getserver` | `getguild` | Get a YAML file detailing all rules in this server. |
| `!permissions explain` | — | Explain how permissions works. |
| `!permissions setdefaultglobalrule <allow_or_deny> <cog_or_command>` | — | Set the default global rule for a command. |
| `!permissions removeserverrule <cog_or_command> <who_or_what...>` | `removeguildrule` | Remove a server rule from a command. |
| `!permissions clearserverrules` | `clearguildrules` | Reset all rules in this server. |
| `!permissions addglobalrule <allow_or_deny> <cog_or_command> <who_or_what...>` | — | Add a global rule to a command. |
| `!permissions setdefaultserverrule <allow_or_deny> <cog_or_command>` | `setdefaultguildrule` | Set the default rule for a command in this server. |
| `!permissions clearglobalrules` | — | Reset all global rules. |
| `!permissions canrun <user> <command>` | — | Check if a user can run a command. |

## reports (5)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!reportset` | — | Manage Reports. |
| `!reportset output <channel>` | — | Set the channel where reports will be sent. |
| `!reportset toggle` | `toggleactive` | Enable or disable reporting for this server. |
| `!report [text]` | — | Send a report. |
| `!report interact <ticket_number>` | — | Open a message tunnel. |

## streams (26)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!twitchstream <channel_name>` | — | Check if a Twitch channel is live. |
| `!youtubestream <channel_id_or_name>` | — | Check if a YouTube channel is live. |
| `!picarto <channel_name>` | — | Check if a Picarto channel is live. |
| `!streamalert` | — | Manage automated stream alerts. |
| `!streamalert list` | — | List all active stream alerts in this server. |
| `!streamalert stop [disable_all=No]` | — | Disable all stream alerts in this channel or server. |
| `!streamalert picarto <channel_name> [discord_channel=<this channel>]` | — | Toggle alerts in this channel for a Picarto stream. |
| `!streamalert twitch <channel_name> [discord_channel=<this channel>]` | — | Manage Twitch stream notifications. |
| `!streamalert twitch channel <channel_name> [discord_channel=<this channel>]` | — | Toggle alerts in this or the given channel for a Twitch stream. |
| `!streamalert youtube <channel_name_or_id> [discord_channel=<this channel>]` | — | Toggle alerts in this channel for a YouTube stream. |
| `!streamset` | — | Manage stream alert settings. |
| `!streamset youtubekey` | — | Explain how to set the YouTube token. |
| `!streamset twitchtoken` | — | Explain how to set the twitch token. |
| `!streamset autodelete <on_off>` | — | Toggle alert deletion for when streams go offline. |
| `!streamset ignorereruns` | — | Toggle excluding rerun streams from alerts. |
| `!streamset ignoreschedule` | — | Toggle excluding YouTube streams schedules from alerts. |
| `!streamset usebuttons` | — | Toggle whether to use buttons for stream alerts. |
| `!streamset message` | — | Manage custom messages for stream alerts. |
| `!streamset message nomention <message>` | — | Set stream alert message when mentions are disabled. |
| `!streamset message mention <message>` | — | Set stream alert message when mentions are enabled. |
| `!streamset message clear` | — | Reset the stream alert messages in this server. |
| `!streamset timer <refresh_time>` | — | Set stream check refresh time. |
| `!streamset mention` | — | Manage mention settings for stream alerts. |
| `!streamset mention role <role>` | — | Toggle a role mention. |
| `!streamset mention all` | `everyone` | Toggle the `@​everyone` mention. |
| `!streamset mention online` | `here` | Toggle the `@​here` mention. |

## trivia (21)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!triviaset` | — | Manage Trivia settings. |
| `!triviaset stopafter <seconds>` | — | Set how long until trivia stops due to no response. |
| `!triviaset botplays <true_or_false>` | — | Set whether or not the bot gains points. |
| `!triviaset custom` | — | Manage Custom Trivia lists. |
| `!triviaset custom list` | — | List uploaded custom trivia. |
| `!triviaset custom upload` | `add` | Upload a trivia file. |
| `!triviaset custom delete <name>` | `remove` | Delete a trivia file. |
| `!triviaset showsettings` | — | Show the current trivia settings. |
| `!triviaset payout <multiplier>` | — | Set the payout multiplier. |
| `!triviaset override <enabled>` | — | Allow/disallow trivia lists to override settings. |
| `!triviaset timelimit <seconds>` | — | Set the maximum seconds permitted to answer a question. |
| `!triviaset usespoilers <true_or_false>` | — | Set if bot will display the answers in spoilers. |
| `!triviaset maxscore <score>` | — | Set the total points required to win. |
| `!triviaset revealanswer <true_or_false>` | — | Set whether or not the answer is revealed. |
| `!trivia <categories...>` | — | Start trivia session on the specified category. |
| `!trivia stop` | — | Stop an ongoing trivia session. |
| `!trivia leaderboard` | `lboard` | Leaderboard for trivia. |
| `!trivia leaderboard server [sort_by=wins] [top=10]` | — | Leaderboard for this server. |
| `!trivia leaderboard global [sort_by=wins] [top=10]` | — | Global trivia leaderboard. |
| `!trivia info <category>` | — | Get information about a trivia category. |
| `!trivia list` | — | List available trivia categories. |

## warnings (20)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!warningset` | — | Manage settings for Warnings. |
| `!warningset usewarnchannel <true_or_false>` | — | Set if warnings should be sent to a channel set with `[p]warningset warnchannel`. |
| `!warningset mywarnings` | — | Manage the settings for `[p]mywarnings`. |
| `!warningset mywarnings sendtodms <true_or_false>` | — | Whether a member self requesting their warnings with `[p]mywarnings` should get them sent to DMs or in the current channel. |
| `!warningset allowcustomreasons <allowed>` | — | Enable or disable custom reasons for a warning. |
| `!warningset senddm <true_or_false>` | — | Set whether warnings should be sent to users in DMs. |
| `!warningset showmoderator <true_or_false>` | — | Decide whether the name of the moderator warning a user should be included in the DM to that user when being |
| `!warningset warnchannel [channel]` | — | Set the channel where warnings should be sent to. |
| `!warnaction` | — | Manage automated actions for Warnings. |
| `!warnaction delete <action_name>` | `del`, `remove` | Delete the action with the specified name. |
| `!warnaction add <name> <points>` | — | Create an automated action. |
| `!warnreason` | — | Manage warning reasons. |
| `!warnreason create <name> <points> <description>` | `add` | Create a warning reason. |
| `!warnreason delete <reason_name>` | `remove`, `del` | Delete a warning reason. |
| `!reasonlist` | — | List all configured reasons for Warnings. |
| `!actionlist` | — | List all configured automated actions for Warnings. |
| `!warn <user> [points=1] <reason>` | — | Warn the user for the specified reason. |
| `!warnings <member>` | — | List the warnings for the specified user. |
| `!mywarnings` | — | List warnings for yourself. |
| `!unwarn <member> <warn_id> [reason]` | — | Remove a warning from a user. |

## Core (181)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!ping` | — | Pong. |
| `!info` | — | Shows info about [botname]. |
| `!uptime` | — | Shows [botname]'s uptime. |
| `!mydata` | — | Commands which interact with the data [botname] has about you. |
| `!mydata whatdata` | — | Find out what type of data [botname] stores and why. |
| `!mydata ownermanagement` | — | Commands for more complete data handling. |
| `!mydata ownermanagement allowuserdeletions` | — | Set the bot to allow users to request a data deletion. |
| `!mydata ownermanagement disallowuserdeletions` | — | Set the bot to not allow users to request a data deletion. |
| `!mydata ownermanagement deleteforuser <user_id>` | — | Delete data [botname] has about a user for a user. |
| `!mydata ownermanagement deleteuserasowner <user_id>` | — | Delete data [botname] has about a user. |
| `!mydata ownermanagement setuserdeletionlevel <level>` | — | Sets how user deletions are treated. |
| `!mydata ownermanagement processdiscordrequest <user_id>` | — | Handle a deletion request from Discord. |
| `!mydata 3rdparty` | — | View the End User Data statements of each 3rd-party module. |
| `!mydata forgetme` | — | Have [botname] forget what it knows about you. |
| `!mydata getmydata` | — | [Coming Soon] Get what data [botname] has about you. |
| `!embedset` | — | Commands for toggling embeds on or off. |
| `!embedset showsettings [command]` | — | Show the current embed settings. |
| `!embedset user [enabled]` | — | Sets personal embed setting for DMs. |
| `!embedset global` | — | Toggle the global embed setting. |
| `!embedset channel <channel> [enabled]` | — | Set's a channel's embed setting. |
| `!embedset command <command> [enabled]` | — | Sets a command's embed setting. |
| `!embedset command global <command> [enabled]` | — | Sets a command's embed setting globally. |
| `!embedset command server <command> [enabled]` | `guild` | Sets a command's embed setting for the current server. |
| `!embedset server [enabled]` | `guild` | Set the server's embed setting. |
| `!traceback [public=False]` | — | Sends to the owner the last command exception that has occurred. |
| `!invite` | — | Shows [botname]'s invite url. |
| `!inviteset` | — | Commands to setup [botname]'s invite settings. |
| `!inviteset commandscope` | — | Add the `applications.commands` scope to your invite URL. |
| `!inviteset public [confirm=False]` | — | Toggles if `[p]invite` should be accessible for the average user. |
| `!inviteset perms <level>` | — | Make the bot create its own role with permissions on join. |
| `!leave [servers...]` | — | Leaves servers. |
| `!servers` | — | Lists the servers [botname] is currently in. |
| `!load <cogs...>` | — | Loads cog packages from the local paths and installed cogs. |
| `!unload <cogs...>` | — | Unloads previously loaded cog packages. |
| `!reload <cogs...>` | — | Reloads cog packages. |
| `!slash` | — | Base command for managing what application commands are able to be used on [botname]. |
| `!slash disablecog <cog_names...>` | — | Marks all application commands in a cog as being disabled, preventing them from being added to the bot. |
| `!slash enablecog <cog_names...>` | — | Marks all application commands in a cog as being enabled, allowing them to be added to the bot. |
| `!slash sync [guild]` | — | Syncs the slash settings to discord. |
| `!slash enable <command_name> ["slash"\|"message"\|"user"=slash]` | — | Marks an application command as being enabled, allowing it to be added to the bot. |
| `!slash list` | — | List the slash commands the bot can see, and whether or not they are enabled. |
| `!slash disable <command_name> ["slash"\|"message"\|"user"=slash]` | — | Marks an application command as being disabled, preventing it from being added to the bot. |
| `!shutdown [silently=False]` | — | Shuts down the bot. |
| `!restart [silently=False]` | — | Attempts to restart [botname]. |
| `!bankset` | — | Base command for bank settings. |
| `!bankset maxbal <amount>` | — | Set the maximum balance a user can get. |
| `!bankset prune` | — | Base command for pruning bank accounts. |
| `!bankset prune server [confirmation=False]` | `guild`, `local` | Prune bank accounts for users no longer in the server. |
| `!bankset prune user <user> [confirmation=False]` | — | Delete the bank account of a specified user. |
| `!bankset prune global [confirmation=False]` | — | Prune bank accounts for users who no longer share a server with the bot. |
| `!bankset showsettings` | — | Show the current bank settings. |
| `!bankset bankname <name>` | — | Set the bank's name. |
| `!bankset reset [confirmation=False]` | — | Delete all bank accounts. |
| `!bankset creditsname <name>` | — | Set the name for the bank's currency. |
| `!bankset toggleglobal [confirm=False]` | — | Toggle whether the bank is global or not. |
| `!bankset registeramount <creds>` | — | Set the initial balance for new bank accounts. |
| `!modlogset` | — | Manage modlog settings. |
| `!modlogset fixcasetypes` | — | Command to fix misbehaving casetypes. |
| `!modlogset cases [action]` | — | Enable or disable case creation for a mod action. |
| `!modlogset modlog [channel]` | `channel` | Set a channel as the modlog. |
| `!modlogset resetcases` | — | Reset all modlog cases in this server. |
| `!set` | — | Commands for changing [botname]'s settings. |
| `!set roles` | — | Set server's admin and mod roles for [botname]. |
| `!set roles removemodrole <role>` | `remmodrole`, `delmodrole`, `deletemodrole` | Removes a mod role for this server. |
| `!set roles addadminrole <role>` | — | Adds an admin role for this server. |
| `!set roles removeadminrole <role>` | `remadmindrole`, `deladminrole`, `deleteadminrole` | Removes an admin role for this server. |
| `!set roles addmodrole <role>` | — | Adds a moderator role for this server. |
| `!set deletedelay [time]` | — | Set the delay until the bot removes the command message. |
| `!set usebotcolour` | `usebotcolor` | Toggle whether to use the bot owner-configured colour for embeds. |
| `!set fuzzy` | — | Toggle whether to enable fuzzy command search in DMs. |
| `!set bot` | `metadata` | Commands for changing [botname]'s metadata. |
| `!set bot nickname [nickname]` | — | Sets [botname]'s nickname for the current server. |
| `!set bot description [description]` | — | Sets the bot's description. |
| `!set bot custominfo [text]` | — | Customizes a section of `[p]info`. |
| `!set bot avatar [url]` | — | Sets [botname]'s avatar |
| `!set bot avatar remove` | `clear` | Removes [botname]'s avatar. |
| `!set bot banner [url]` | — | Sets [botname]'s banner |
| `!set bot banner remove` | `clear` | Removes [botname]'s banner. |
| `!set bot username <username>` | `name` | Sets [botname]'s username. |
| `!set errormsg [msg]` | — | Set the message that will be sent on uncaught bot errors. |
| `!set status` | — | Commands for setting [botname]'s status. |
| `!set status streaming [(<streamer> <stream_title>)]` | `stream`, `twitch` | Sets [botname]'s streaming status to a twitch stream. |
| `!set status invisible` | `offline` | Set [botname]'s status to invisible. |
| `!set status watching [watching]` | — | Sets [botname]'s watching status. |
| `!set status competing [competing]` | — | Sets [botname]'s competing status. |
| `!set status custom [text]` | — | Sets [botname]'s custom status. |
| `!set status online` | — | Set [botname]'s status to online. |
| `!set status dnd` | `donotdisturb`, `busy` | Set [botname]'s status to do not disturb. |
| `!set status idle` | `away`, `afk` | Set [botname]'s status to idle. |
| `!set status listening [listening]` | — | Sets [botname]'s listening status. |
| `!set status playing [game]` | `game` | Sets [botname]'s playing status. |
| `!set serverfuzzy` | — | Toggle whether to enable fuzzy command search for the server. |
| `!set showsettings [server]` | — | Show the current settings for [botname]. |
| `!set usebuttons [use_buttons]` | — | Set a global bot variable for using buttons in menus. |
| `!set regionalformat <language_code>` | `region` | Changes the bot's regional format in this server. This is used for formatting date, time and numbers. |
| `!set regionalformat global <language_code>` | — | Changes the bot's regional format. This is used for formatting date, time and numbers. |
| `!set regionalformat server <language_code>` | `local`, `guild` | Changes the bot's regional format in this server. This is used for formatting date, time and numbers. |
| `!set ownernotifications` | — | Commands for configuring owner notifications. |
| `!set ownernotifications optin` | — | Opt-in on receiving owner notifications. |
| `!set ownernotifications adddestination <channel>` | — | Adds a destination text channel to receive owner notifications. |
| `!set ownernotifications removedestination <channel>` | `remdestination`, `deletedestination`, `deldestination` | Removes a destination text channel from receiving owner notifications. |
| `!set ownernotifications listdestinations` | — | Lists the configured extra destinations for owner notifications. |
| `!set ownernotifications optout` | — | Opt-out of receiving owner notifications. |
| `!set serverprefix [server] [prefixes...]` | `serverprefixes` | Sets [botname]'s server prefix(es). |
| `!set locale <language_code>` | — | Changes [botname]'s locale in this server. |
| `!set locale global <language_code>` | — | Changes [botname]'s default locale. |
| `!set locale server <language_code>` | `local`, `guild` | Changes [botname]'s locale in this server. |
| `!set api [service] [tokens]` | — | Commands to set, list or remove various external API tokens. |
| `!set api list` | — | Show all external API services along with their keys that have been set. |
| `!set api remove <services...>` | — | Remove the given services with all their keys and tokens. |
| `!set colour [colour]` | `color` | Sets a default colour to be used for the bot's embeds. |
| `!set prefix <prefixes...>` | `prefixes`, `globalprefix`, `globalprefixes` | Sets [botname]'s global prefix(es). |
| `!helpset` | — | Commands to manage settings for the help command. |
| `!helpset showsettings` | — | Show the current help settings. |
| `!helpset showhidden [show_hidden]` | — | This allows the help command to show hidden commands. |
| `!helpset verifychecks [verify]` | — | Sets if commands which can't be run in the current context should be filtered from help. |
| `!helpset reacttimeout <seconds>` | — | Set the timeout for reactions, if menus are enabled. |
| `!helpset pagecharlimit <limit>` | — | Set the character limit for each page in the help message. |
| `!helpset tagline [tagline]` | — | Set the tagline to be used. |
| `!helpset resetsettings` | — | This resets [botname]'s help settings to their defaults. |
| `!helpset usemenus <"buttons"\|"reactions"\|"select"\|"selectonly"\|"disable">` | — | Allows the help command to be sent as a paginated menu instead of separate |
| `!helpset usetick [use_tick]` | — | This allows the help command message to be ticked if help is sent to a DM. |
| `!helpset deletedelay <seconds>` | — | Set the delay after which help pages will be deleted. |
| `!helpset resetformatter` | — | This resets [botname]'s help formatter to the default formatter. |
| `!helpset verifyexists [verify]` | — | Sets whether the bot should respond to help commands for nonexistent topics. |
| `!helpset showaliases [show_aliases]` | — | This allows the help command to show existing commands aliases if there is any. |
| `!helpset maxpages <pages>` | — | Set the maximum number of help pages sent in a server channel. |
| `!contact <message>` | — | Sends a message to the owner. |
| `!dm <user_id> <message>` | — | Sends a DM to a user. |
| `!datapath` | — | Prints the bot's data path. |
| `!debuginfo` | — | Shows debug information useful for debugging. |
| `!diagnoseissues [channel=<this channel>] <member> <command_name>` | — | Diagnose issues with the command checks with ease! |
| `!allowlist` | `whitelist` | Commands to manage the allowlist. |
| `!allowlist list` | — | Lists users on the allowlist. |
| `!allowlist add <users...>` | — | Adds users to the allowlist. |
| `!allowlist remove <users...>` | — | Removes users from the allowlist. |
| `!allowlist clear` | — | Clears the allowlist. |
| `!blocklist` | `blacklist`, `denylist` | Commands to manage the blocklist. |
| `!blocklist clear` | — | Clears the blocklist. |
| `!blocklist remove <users...>` | — | Removes users from the blocklist. |
| `!blocklist list` | — | Lists users on the blocklist. |
| `!blocklist add <users...>` | — | Adds users to the blocklist. |
| `!localallowlist` | `localwhitelist` | Commands to manage the server specific allowlist. |
| `!localallowlist clear` | — | Clears the allowlist. |
| `!localallowlist add <users_or_roles...>` | — | Adds a user or role to the server allowlist. |
| `!localallowlist list` | — | Lists users and roles on the server allowlist. |
| `!localallowlist remove <users_or_roles...>` | — | Removes user or role from the allowlist. |
| `!localblocklist` | `localblacklist` | Commands to manage the server specific blocklist. |
| `!localblocklist list` | — | Lists users and roles on the server blocklist. |
| `!localblocklist remove <users_or_roles...>` | — | Removes user or role from local blocklist. |
| `!localblocklist clear` | — | Clears the server blocklist. |
| `!localblocklist add <users_or_roles...>` | — | Adds a user or role to the local blocklist. |
| `!command` | — | Commands to enable and disable commands and cogs. |
| `!command listdisabled` | — | List disabled commands. |
| `!command listdisabled guild` | — | List disabled commands in this server. |
| `!command listdisabled global` | — | List disabled commands globally. |
| `!command disabledmsg [message]` | — | Set the bot's response to disabled commands. |
| `!command disablecog <cog>` | — | Disable a cog in this server. |
| `!command defaultdisablecog <cog>` | — | Set the default state for a cog as disabled. |
| `!command listdisabledcogs` | — | List the cogs which are disabled in this server. |
| `!command enablecog <cog>` | — | Enable a cog in this server. |
| `!command disable <command>` | — | Disable a command. |
| `!command disable server <command>` | `guild` | Disable a command in this server only. |
| `!command disable global <command>` | — | Disable a command globally. |
| `!command defaultenablecog <cog>` | — | Set the default state for a cog as enabled. |
| `!command enable <command>` | — | Enable a command. |
| `!command enable global <command>` | — | Enable a command globally. |
| `!command enable server <command>` | `guild` | Enable a command in this server. |
| `!autoimmune` | — | Commands to manage server settings for immunity from automated actions. |
| `!autoimmune remove <user_or_role>` | — | Remove a user or role from being immune to automated moderation actions. |
| `!autoimmune list` | — | Gets the current members and roles configured for automatic moderation action immunity. |
| `!autoimmune add <user_or_role>` | — | Makes a user or role immune from automated moderation actions. |
| `!autoimmune isimmune <user_or_role>` | — | Checks if a user or role would be considered immune from automated actions. |
| `!ignore` | — | Commands to add servers or channels to the ignore list. |
| `!ignore list` | — | List the currently ignored servers and channels. |
| `!ignore channel [channel=<this channel>]` | — | Ignore commands in the channel, thread, or category. |
| `!ignore server` | `guild` | Ignore commands in this server. |
| `!unignore` | — | Commands to remove servers or channels from the ignore list. |
| `!unignore channel [channel=<this channel>]` | — | Remove a channel, thread, or category from the ignore list. |
| `!unignore server` | `guild` | Remove this server from the ignore list. |
| `!licenseinfo` | `licenceinfo` | Get info about Red's licenses. |

## CogManagerUI (6)

| Command | Aliases | What it does |
| --- | --- | --- |
| `!paths` | — | Lists current cog paths in order of priority. |
| `!addpath <path>` | — | Add a path to the list of available cog paths. |
| `!removepath <path_numbers...>` | — | Removes one or more paths from the available cog paths given the `path_numbers` from `[p]paths`. |
| `!reorderpath <from> <to>` | — | Reorders paths internally to allow discovery of different cogs. |
| `!installpath [path]` | — | Returns the current install path or sets it if one is provided. |
| `!cogs` | — | Lists all loaded and available cogs. |
