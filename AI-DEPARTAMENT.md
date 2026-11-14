# AI Департамент Переводчик

Браузерное расширение для двуязычного перевода сайтов, PDF, картинок и субтитров к видео — с любого языка на русский и **казахский**.

Сделано [AI Департаментом](https://aidepartament.com/perevodchik) на основе открытого проекта
[FluentRead](https://github.com/FluentRead/FluentRead). Лицензия — **GPL-3.0** (файл `LICENSE`), как и у оригинала.
Исходный код этой версии открыт и находится в этом репозитории.

## Что изменено относительно FluentRead

| Что | Где |
|---|---|
| Казахский (`kk`) добавлен в список языков перевода, с подписями на всех языках интерфейса | `src/core/language/catalog.ts`, `src/core/config/catalog.ts` |
| Интерфейс по умолчанию — русский, перевод по умолчанию — на русский | `src/core/config/catalog.ts` (`defaultOption`) |
| Название «AI Департамент Переводчик» и иконка | `src/core/i18n/messages/*.ts` (`common.brand`), `public/icon/*` |
| Для ИИ-моделей (Claude, GPT и др.) казахский передаётся явно как «Kazakh (kk)», а не голым кодом | `src/services/translation/templates.ts` |
| Тест-корпус: казахские примеры для определения языка страницы | `tests/fixtures/target-language-release-corpus.json` |
| Описание в магазине расширений | `src/core/i18n/messages/product-descriptions.json` |

## Установка (для клиента)

1. Распакуйте архив `ai-departament-perevodchik.zip`.
2. В Chrome откройте `chrome://extensions` и включите «Режим разработчика» (справа сверху).
3. Нажмите «Загрузить распакованное» и выберите папку `ai-departament-perevodchik`.
4. Откройте настройки расширения → «Язык перевода» → выберите нужный (например, «казахский»).

Версия как userscript (Tampermonkey) не поддерживается: её тесты сверяют иконку и список языков оригинала.

## Сборка

Нужны Node.js 22.23+ и pnpm 12.

```bash
bash scripts/ai-departament/build.sh   # → dist/ai-departament-perevodchik.zip
```

## Обновление из оригинального FluentRead

```bash
bash scripts/ai-departament/sync-upstream.sh
```

Скрипт подтягивает свежий `main` из FluentRead и вливает его в этот форк. Если в тех же местах кода
что-то поменялось, git покажет конфликт — его нужно разрешить (обычно это 1–2 строки в списке языков),
затем `git commit` и `git push`.
