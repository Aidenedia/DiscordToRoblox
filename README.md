# DiscordToRoblox
I wrote a discord bot and flask server which gets input from a discord server and looks for the commands Forward,back,left,right or jump, and if the bot finds one of these commands it sends a post command to the flask server. I made a simple move to command in roblox and a get request which gets the command sent by the discord bot, moves in that direction and then resets the post back to none, and then keeps waiting a second until theres a new post request.

**The roblox script is very simple and just moves a certain person, its very easy to customize it to move all players, or a object, or whatever you like.**

**For test purposes its very easy to run the flask script on https://render.com**


**How to use. First, set up your discord bot, invite the bot to your discord server, get your token and put it in the token variable in main.py, now the discord bot should be working. Second, sort out whatever hosting you're using to host the flask server, if you're using render set it and then run it and then that should be working. Last step make sure you create a script in serverscriptservice and copy and paste move.lua into it. you should be all done now, goodluck with your coding!**

https://github.com/user-attachments/assets/02978c0b-788f-42b7-a7cf-a16880072310


