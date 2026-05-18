import os
import base64
import requests
from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, MessageHandler, ContextTypes, filters

# =========================
# تنظیمات
# =========================
TELEGRAM_BOT_TOKEN = "8839710034:AAGlC8nR3TJw1cmYqOnJ91N_-TpgwkeUeEY"

GITHUB_TOKEN = "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"
GITHUB_USERNAME = "sbn-program"
GITHUB_REPO = "telegram-forward-downloader"
GITHUB_FOLDER = "downloads"   # پوشه داخل ریپو

TEMP_DIR = "temp_files"
os.makedirs(TEMP_DIR, exist_ok=True)

# =========================
# تابع آپلود به GitHub
# =========================
def upload_file_to_github(local_file_path, github_file_path, commit_message="Upload file from Telegram bot"):
    with open(local_file_path, "rb") as f:
        content = f.read()

    encoded_content = base64.b64encode(content).decode("utf-8")

    url = f"https://api.github.com/repos/{GITHUB_USERNAME}/{GITHUB_REPO}/contents/{github_file_path}"

    headers = {
        "Authorization": f"token {GITHUB_TOKEN}",
        "Accept": "application/vnd.github+json"
    }

    data = {
        "message": commit_message,
        "content": encoded_content
    }

    response = requests.put(url, headers=headers, json=data)

    return response.status_code, response.json()

# =========================
# دستور /start
# =========================
async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("سلام. لطفا فایل فوروارد شده را ارسال کن تا داخل GitHub آپلود کنم.")

# =========================
# پردازش پیام‌ها و فایل‌ها
# =========================
async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE):
    message = update.message

    if not message:
        return

    # بررسی اینکه پیام فوروارد شده است یا خیر
    if not message.forward_date:
        await message.reply_text("لطفا فقط فایل‌های فوروارد شده ارسال کنید.")
        return

    document = message.document
    photo = message.photo

    # اگر فایل نوع document باشد
    if document:
        file_id = document.file_id
        file_name = document.file_name

    # اگر فایل عکس باشد
    elif photo:
        biggest_photo = photo[-1]  # بزرگترین سایز عکس
        file_id = biggest_photo.file_id
        file_name = f"{file_id}.jpg"

    else:
        await message.reply_text("لطفا فقط فایل فوروارد شده از نوع عکس یا سند ارسال کنید.")
        return

    # دانلود فایل در TEMP_DIR
    file = await context.bot.get_file(file_id)
    local_file_path = os.path.join(TEMP_DIR, file_name)
    await file.download_to_drive(custom_path=local_file_path)

    # مسیر داخل گیت‌هاب
    github_file_path = f"{GITHUB_FOLDER}/{file_name}"

    # آپلود فایل به گیت‌هاب
    status_code, response_json = upload_file_to_github(local_file_path, github_file_path)

    if status_code == 201 or status_code == 200:
        await message.reply_text(f"فایل با موفقیت به گیت‌هاب آپلود شد.\n🧾 مسیر: `{github_file_path}`", parse_mode='Markdown')
    else:
        await message.reply_text(f"مشکلی در آپلود فایل به گیت‌هاب پیش آمد.\nخطا: {response_json}")

    # حذف فایل محلی بعد از آپلود
    os.remove(local_file_path)

# =========================
# اجرای ربات
# =========================
if __name__ == '__main__':
    app = ApplicationBuilder().token(TELEGRAM_BOT_TOKEN).build()

    app.add_handler(CommandHandler("start", start))
    app.add_handler(MessageHandler(filters.ALL, handle_message))

    print("Bot is polling...")
    app.run_polling()
