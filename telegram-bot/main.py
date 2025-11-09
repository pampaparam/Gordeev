import telebot

bot = telebot.Telebot('7369357860:AAHjVxgy1c0ZAtlh8nF2WAxcpXvwRAOJh6s')

@bot.message_handlers(commands=['start'])
def main(message):
    bot.send_message(message.chat.id, 'Привет!')