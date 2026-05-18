# 🔥 Auto Downloader GitHub Action

یک اکشن کاملاً خودکار گیت‌هاب برای دانلود فایل‌ها، فشرده‌سازی، تقسیم هوشمند فایل‌های حجیم و انتشار مستقیم روی شاخه **main**.

---

## 🇺🇸 English Version

### 🚀 Features
- ✅ Manual execution via `workflow_dispatch`
- 🔐 Simple one-time activation system (cached)
- ⬇️ High-speed downloads using **aria2**
- 📁 Dedicated folder for each download (with secure random ID)
- 🗜️ Optional ZIP compression
- 📏 Intelligent size check before splitting
- ✂️ Automatic splitting **only if file size exceeds 50MB**
- ✅ Multi-part ZIP compatible with WinRAR / 7-Zip
- 🔒 Optional ZIP password protection
- 📝 Auto-generated README for each download package
- 🚀 Automatic commit & push directly to the **main** branch
- ❌ No clutter or temporary files in the repository root

### 📂 Output Structure
```
output/
└── <random_id>/
    ├── <random_id>.zip
    ├── <random_id>.z01
    └── README.md
```

### 🧠 How It Works
1. User manually triggers the workflow from the **Actions** tab  
2. Files are downloaded using **aria2**  
3. A secure random ID is generated for each download  
4. Files are placed into a dedicated folder  
5. ZIP archive is created  
6. If the ZIP size exceeds 50MB, it is automatically split  
7. Files are committed and pushed directly to the **main** branch  
8. A README is generated inside each package folder  

### ▶️ Usage
Run the workflow and provide:
- Download URL(s)  
- ZIP mode (enabled or disabled)  
- ZIP password (optional)  
- Activation code (only required on first run)  

---

## 🇮🇷 نسخه فارسی

### 🚀 امکانات
- ✅ اجرای دستی اکشن با `workflow_dispatch`  
- 🔐 سیستم فعال‌سازی ساده و کش‌شده (فقط یک‌بار)  
- ⬇️ دانلود پرسرعت با aria2  
- 📁 ایجاد فولدر اختصاصی برای هر دانلود (شناسه تصادفی امن)  
- 🗜️ فشرده‌سازی ZIP (اختیاری)  
- 📏 بررسی هوشمند حجم قبل از تقسیم  
- ✂️ تقسیم خودکار فقط در صورت بیشتر بودن حجم از ۵۰ مگابایت  
- ✅ ZIP چندبخشی سازگار با WinRAR و 7‑Zip  
- 🔒 امکان رمزگذاری ZIP  
- 📝 تولید خودکار README برای هر بسته دانلود  
- 🚀 ارسال مستقیم Commit و Push روی شاخه **main**  
- ❌ عدم ایجاد فایل اضافی در روت مخزن  

### 📂 ساختار خروجی
```
output/
└── <random_id>/
    ├── <random_id>.zip
    ├── <random_id>.z01
    └── README.md
```

### 🧠 نحوه عملکرد
1. اجرای دستی اکشن از تب **Actions**  
2. دانلود فایل‌ها با استفاده از **aria2**  
3. تولید شناسه تصادفی امن برای هر دانلود  
4. قرار دادن فایل‌ها در فولدر اختصاصی  
5. ساخت فایل ZIP  
6. تقسیم خودکار ZIP در صورت بزرگ‌تر بودن از ۵۰ مگابایت  
7. ارسال مستقیم خروجی‌ها روی شاخه **main**  
8. ساخت README در هر فولدر بسته دانلود  

### ▶️ نحوه استفاده
اکشن را اجرا کرده و موارد زیر را وارد کنید:
- لینک یا لینک‌های دانلود  
- وضعیت ZIP (فعال / غیرفعال)  
- رمز ZIP (در صورت نیاز)  
- کد فعال‌سازی (فقط بار اول)

---

## ⚠️ Notes
- This project is intended for **personal and educational use only**  
- Ensure you have the **legal rights** to download and redistribute the target files  
- **Package-specific READMEs** are generated automatically inside each output folder  
