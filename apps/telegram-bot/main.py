#!/usr/bin/env python3
import asyncio
import os
import logging
import random
from datetime import datetime
from dotenv import load_dotenv
from aiogram import Bot, Dispatcher, F
from aiogram.filters import Command
from aiogram.types import Message, CallbackQuery, InlineKeyboardMarkup, InlineKeyboardButton
from aiogram.fsm.storage.memory import MemoryStorage

load_dotenv()
TOKEN = os.getenv("BOT_TOKEN")

dp = Dispatcher(storage=MemoryStorage())
logging.basicConfig(level=logging.INFO)

@dp.message(Command("start"))
async def cmd_start(message: Message):
    await message.answer("🚀 Бот улучшен! Доступные команды:\n/help - справка\n/menu - меню\n/info - информация")

@dp.message(Command("help"))
async def cmd_help(message: Message):
    help_text = """
📋 Доступные команды:
/start - запуск бота
/help - эта справка  
/menu - интерактивное меню
/info - системная информация
/time - текущее время
    """
    await message.answer(help_text)

@dp.message(Command("menu"))
async def cmd_menu(message: Message):
    keyboard = InlineKeyboardMarkup(inline_keyboard=[
        [InlineKeyboardButton(text="⏰ Время", callback_data="time")],
        [InlineKeyboardButton(text="ℹ️ Инфо", callback_data="info")],
        [InlineKeyboardButton(text="🎲 Случайное число", callback_data="random")]
    ])
    await message.answer("Выберите действие:", reply_markup=keyboard)

@dp.message(Command("info"))
async def cmd_info(message: Message):
    await message.answer(f"👤 ID: {message.from_user.id}\n👤 Имя: {message.from_user.full_name}")

# 🎯 НОВЫЕ CALLBACK ОБРАБОТЧИКИ
@dp.callback_query(F.data == "time")
async def callback_time(callback: CallbackQuery):
    current_time = datetime.now().strftime("%H:%M:%S %d.%m.%Y")
    await callback.message.edit_text(f"🕐 Сейчас: {current_time}")
    await callback.answer()  # Убирает "часики"

@dp.callback_query(F.data == "info")
async def callback_info(callback: CallbackQuery):
    await callback.message.edit_text(f"👤 ID: {callback.from_user.id}\n👤 Имя: {callback.from_user.full_name}")
    await callback.answer()

@dp.callback_query(F.data == "random")
async def callback_random(callback: CallbackQuery):
    number = random.randint(1, 100)
    await callback.message.edit_text(f"🎲 Случайное число: {number}")
    await callback.answer()

async def main():
    bot = Bot(token=TOKEN)
    try:
        print("🤖 Улучшенный бот стартует...")
        await dp.start_polling(bot)
    finally:
        await bot.session.close()

if __name__ == "__main__":
    asyncio.run(main())
