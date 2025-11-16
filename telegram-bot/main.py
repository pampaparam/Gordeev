import telebot

bot = telebot.TeleBot('7369357860:AAHjVxgy1c0ZAtlh8nF2WAxcpXvwRAOJh6s')

m = title + "\n" + post
if len(m) > 4095:
    for x in range(0, len(m), 4095):
        bot.reply_to(message, text=m[x:x+4095])
else:
    bot.reply_to(message, text=m)



@bot.message_handler(commands=['start'])
def main(message):
    bot.send_message(message.chat.id, message)



@bot.message_handler(commands=['help'])
def main(message):
    bot.send_message(message.chat.id, '<b>Help</b> <em><u>information</u></em>', parse_mode='html')


bot.polling(none_stop=True)