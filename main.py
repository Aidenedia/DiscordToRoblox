import discord
import aiohttp

FLASK_URL = "YOUR FLASK SITE HERE"
token = "YOUR TOKEN HERE"


Intents = discord.Intents.default()
Intents.message_content = True

client = discord.Client(intents=Intents)

@client.event
async def on_ready():
    print(f"We have logged in on {client.user}")

@client.event
async def on_message(message):
    if message.author != client.user:
        content = message.content.lower()
        valid_commands = ["forward","back","left","right","jump"]
        if content in valid_commands:
            try:
                async with aiohttp.ClientSession() as session:
                    async with session.post(FLASK_URL, data=content) as resp:
                        await message.channel.send(f"Sent {content} - status {resp.status}")
            except Exception as s:
                await message.channel.send(f"ERROR, {s}")

client.run(token)
