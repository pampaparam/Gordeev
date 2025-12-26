import os

import asyncio
from aiogram import Bot, Dispatcher
from aiogram.types import Message
from aiogram.filters import Command


BOT_TOKEN = os.getenv("BOT_TOKEN")


bot = Bot(token=BOT_TOKEN)
dp = Dispatcher()



@dp.message(Command("start"))
async def process_start_command(message: Message):
    await message.answer("Hello! I'm your friendly Telegram bot. How can I assist you today?")

async def handler(event: dict, context):
    print(f"{event=}")
    print(f"{context=}")
    
    return {"statusCode": 200, "body": "OK"}

    if text == "/start":
        await bot.send_message(chat_id, "Hello! I'm your friendly Telegram bot. How can I assist you today?")

async def main():
    await dp.start_polling(bot)


if __name__ == "__main__":
    import asyncio
    asyncio.run(main())