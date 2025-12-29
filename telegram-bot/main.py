import os
import json
import asyncio
from aiogram import Bot, Dispatcher
from aiogram.types import Update
from aiogram.filters import Command

BOT_TOKEN = os.getenv("BOT_TOKEN")
bot = Bot(token=BOT_TOKEN)
dp = Dispatcher()

@dp.message(Command("start"))
async def process_start_command(message):
    await message.answer("Hello! I'm your friendly Telegram bot.")

async def handler(event, context):
    body = json.loads(event['body']) if isinstance(event['body'], str) else event['body']
    update = Update(**body)
    await dp.feed_update(bot, update)
    return {"statusCode": 200, "body": json.dumps({"ok": True})}
