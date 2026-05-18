import os
from telegram import Update
from telegram.ext import (
    ApplicationBuilder,
    MessageHandler,
    ContextTypes,
    filters,
)

DOWNLOAD_DIR = "downloads"
CHUNK_SIZE = 50 * 1024 * 1024  # 50MB

os.makedirs(DOWNLOAD_DIR, exist_ok=True)

def split_file(path, chunk_size=CHUNK_SIZE):
    parts = []
    with open(path, "rb") as f:
        i = 1
        while True:
            chunk = f.read(chunk_size)
            if not chunk:
                break
            part_path = f"{path}.part{i}"
            with open(part_path, "wb") as pf:
                pf.write(chunk)
            parts.append(part_path)
            i += 1
    return parts


async def handle_file(update: Update, context: ContextTypes.DEFAULT_TYPE):
    message = update.message

    file_obj = (
        message.document
        or message.video
        or message.audio
    )

    if not file_obj:
        await message.reply_text("❌ فایل قابل دانلودی پیدا نشد")
        return

    filename = file_obj.file_name or f"file_{file_obj.file_id}"
    file_path = os.path.join(DOWNLOAD_DIR, filename)

    tg_file = await file_obj.get_file()
    await tg_file.download_to_drive(file_path)

    parts = split_file(file_path)

    await message.reply_text(
        f"✅ فایل دانلود شد\n"
        f"📦 تعداد پارت‌ها: {len(parts)}"
    )


def main():
    token = os.environ["BOT_TOKEN"]

    app = ApplicationBuilder().token(token).build()
    app.add_handler(MessageHandler(filters.Document.ALL | filters.VIDEO | filters.AUDIO, handle_file))
    app.run_polling()


if __name__ == "__main__":
    main()
