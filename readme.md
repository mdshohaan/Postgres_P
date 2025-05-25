# 🧑‍💻 PostgreSQL সম্পর্কে প্রশ্নোত্তর (বাংলা)

This document demonstrates how to use **union** (`|`) and **intersection** (`&`) types in TypeScript.

---

## 1. 🔷 Union Type (`|`)

> A value that can be **one of multiple types**.

✅ **Example: Union Type**

```typescript
function printId(id: number | string) {
  console.log("ID:", id);
}

printId(123); // OK: number
printId("abc123"); // OK: string
```

---

## 2. 🔶 Intersection Type (`&`)

> A value that must satisfy **multiple types at the same time**.

✅ **Example: Intersection Type**

```typescript
type Person = {
  name: string;
};

type Employee = {
  employeeId: number;
};

type Staff = Person & Employee;

const john: Staff = {
  name: "John",
  employeeId: 101,
};
```

---

## ✅ Summary

- **Union Type** allows flexibility by accepting values of multiple types.
- **Intersection Type** ensures that a value must satisfy all combined type conditions.

Use these features to write **type-safe and expressive code** in TypeScript!

---

# 🗝️ keyof Keyword in TypeScript

> The `keyof` keyword is used to get a **union of property names** (as string literals) of a given type.

It is helpful when you want to work with dynamic property names in a type-safe way.

✅ **Example: keyof usage**

```typescript
type Product = {
  name: string;
  price: number;
};

type ProductKeys = keyof Product;
// Equivalent to: "name" | "price"

function getValue(obj: Product, key: keyof Product): string | number {
  return obj[key];
}

const pen: Product = { name: "Pen", price: 10 };

console.log(getValue(pen, "name")); // Output: "Pen"
console.log(getValue(pen, "price")); // Output: 10
```

---

## ✅ Summary (Updated)

- **Union Type** allows flexibility by accepting values of multiple types.
- **Intersection Type** ensures that a value must satisfy all combined type conditions.
- **keyof Keyword** helps extract the keys of a type for safe dynamic access.
