import telebot

bot = telebot.TeleBot('7369357860:AAHjVxgy1c0ZAtlh8nF2WAxcpXvwRAOJh6s')

@bot.message_handler(commands=['start'])
def main(message): 
    send_long_message(bot, message.chat.id, message.text)
    
    for i in range(0, len(text), 4096):
        bot.send_message(chat.id, text[i:i+4096])

       

@bot.message_handler(commands=['help'])
def main(message):
    bot.send_message(message.chat.id, '<b>Help</b> <em><u>information</u></em>', parse_mode='html')


bot.polling(none_stop=True)