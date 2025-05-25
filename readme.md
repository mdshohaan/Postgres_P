# 🧑‍💻 PostgreSQL সম্পর্কে প্রশ্নোত্তর (বাংলা)

# 📘 PostgreSQL Essentials

Welcome to the PostgreSQL Essentials guide! This document summarizes the most fundamental concepts of PostgreSQL in Bengali for quick learning and reference.

---

## 1️⃣ PostgreSQL কী?

**PostgreSQL** একটি শক্তিশালী, ওপেন সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি:

- ACID কমপ্লায়েন্ট ✅
- Extensible 🧩
- SQL ও NoSQL ডেটা সাপোর্ট করে
- বড় ও স্কেলযোগ্য প্রজেক্টে ব্যবহারের জন্য উপযুক্ত

---

## 2️⃣ Database Schema এর উদ্দেশ্য কী?

**Schema** হচ্ছে ডেটাবেসের মধ্যে একটি লজিকাল গ্রুপ, যা:

- টেবিল, ফাংশন, ভিউ ইত্যাদি অর্গানাইজ করে
- ইউজার পারমিশন আলাদা রাখতে সাহায্য করে

---

## 3️⃣ Primary Key ও Foreign Key

- **Primary Key:**  
  প্রতিটি রোকে ইউনিকভাবে চিহ্নিত করে  
  ❌ Null ও ❌ Duplicate হতে পারে না

- **Foreign Key:**  
  অন্য টেবিলের Primary Key কে রেফার করে  
  টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে

---

## 4️⃣ VARCHAR vs CHAR

| Feature     | CHAR(n)         | VARCHAR(n)                |
| ----------- | --------------- | ------------------------- |
| Length      | Fixed           | Variable                  |
| Space Usage | Full n bytes    | Only necessary space used |
| Example     | `name CHAR(10)` | `email VARCHAR(50)`       |

---

## 5️⃣ SELECT + WHERE

**WHERE ক্লজ** দিয়ে শর্ত দিয়ে রো নির্বাচন করা যায়।

```sql
SELECT * FROM users WHERE age > 18;
```
