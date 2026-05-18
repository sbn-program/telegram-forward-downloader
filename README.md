# 🔥 Auto Downloader GitHub Action

A fully automated GitHub Action for downloading files, compressing them, intelligently splitting large archives, and publishing the results directly to the **main** branch.

---

## 🇺🇸 English

### 🚀 Features
- ✅ Manual execution via `workflow_dispatch`
- 🔐 Simple activation system (cached, one-time)
- ⬇️ High-speed downloads using **aria2**
- 📁 Dedicated folder for each download (secure random ID)
- 🗜️ ZIP compression (optional)
- 📏 Intelligent size check before splitting
- ✂️ Automatic split **only if file size exceeds 50MB**
- ✅ WinRAR / 7-Zip compatible multi-part ZIP
- 🔒 Optional ZIP password protection
- 📝 Auto-generated README for each download package
- 🚀 Automatic commit & push directly to the **main** branch
- ❌ No clutter or temporary files in the repository root

---

### 📂 Output Structure
output/

└── <random_id>/

├── <random_id>.zip

├── <random_id>.z01

└── README.md

🧠 How It Works
User manually triggers the workflow from the Actions tab
File(s) are downloaded using aria2
A secure random ID is generated for each download
Files are placed into a dedicated folder
ZIP archive is created
If the ZIP size exceeds 50MB, it is automatically split
Files are committed and pushed directly to the main branch
A README is generated inside each package folder
▶️ Usage
Run the workflow and provide:

Download URL(s)
ZIP mode (enabled or disabled)
ZIP password (optional)
Activation code (first run only)
🇮🇷 فارسی
🚀 امکانات
✅ اجرای دستی اکشن با workflow_dispatch
🔐 سیستم فعال‌سازی ساده و کش‌شده (فقط یک‌بار)
⬇️ دانلود پرسرعت با aria2
📁 ایجاد فولدر اختصاصی برای هر دانلود (شناسه تصادفی امن)
🗜️ فشرده‌سازی ZIP (اختیاری)
📏 بررسی هوشمند حجم قبل از تقسیم
✂️ تقسیم خودکار فقط در صورت بیشتر بودن حجم از ۵۰ مگابایت
✅ ZIP چندبخشی سازگار با WinRAR و 7‑Zip
🔒 امکان رمزگذاری ZIP
📝 تولید خودکار README برای هر بسته دانلود
🚀 Commit و Push مستقیم روی شاخه main
❌ بدون ایجاد فایل اضافی در روت مخزن
📂 ساختار خروجی
output/

└── <random_id>/

├── <random_id>.zip

├── <random_id>.z01

└── README.md

🧠 نحوه عملکرد
اجرای دستی اکشن از تب Actions
دانلود فایل‌ها با aria2
تولید شناسه تصادفی امن برای هر دانلود
قرار دادن فایل‌ها در فولدر اختصاصی
ساخت فایل ZIP
تقسیم خودکار ZIP در صورت بزرگ‌تر بودن از ۵۰ مگابایت
Push مستقیم خروجی‌ها روی شاخه main
ساخت README داخل فولدر هر بسته
▶️ نحوه استفاده
اکشن را اجرا کرده و موارد زیر را وارد کنید:

لینک یا لینک‌های دانلود
وضعیت ZIP (فعال / غیرفعال)
رمز ZIP (در صورت نیاز)
کد فعال‌سازی (فقط بار اول)
⚠️ Notes
This project is intended for personal and educational use
Ensure you have the legal right to download and redistribute the target files
✅ *This README describes the project itself.

Package-specific READMEs are generated automatically inside each output folder.*
