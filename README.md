# AzLang Standard Library

AzLang proqramlaşdırma dili üçün rəsmi standart kitabxana.

## Struktur

```
src/
├── *.az       — AzLang mənbə faylları (FFI deklarasiyaları)
├── *.zig      — Zig ilə yazılmış native implementasiyalar
├── *.c        — C ilə yazılmış native implementasiyalar (gələcəkdə)
build.sh       — Zig fayllarını .so-ya çevirən avtomatlaşdırma skripti
```

## Build

```bash
./build.sh
```

## Lisenziya

[MIT](LICENSE)
