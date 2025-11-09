import telebot

bot = telebot.TeleBot('7369357860:AAHjVxgy1c0ZAtlh8nF2WAxcpXvwRAOJh6s')

@bot.message_handler(commands=['start'])
def main(message):
    bot.send_message(message.chat.id, 'Привет!')



bot.polling(none_stop=True)