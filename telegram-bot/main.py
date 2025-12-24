from aiogram import Bot, Dispatcher
from aiogram.types import Message
from aiogram.filters import Command


BOT_TOKEN = "8430017466:AAEW71rfyYUZCAiZibHgISVj3w6glwebdNI"


bot = Bot(token=BOT_TOKEN)
dp = Dispatcher()



@dp.message(Command("start"))
async def process_start_command(message: Message):
    await message.answer("Hello! I'm your friendly Telegram bot. How can I assist you today?")