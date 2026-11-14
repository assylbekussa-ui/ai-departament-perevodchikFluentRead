#!/usr/bin/env bash
# Сборка AI Департамент Переводчик для Chrome → dist/ai-departament-perevodchik.zip
set -euo pipefail
cd "$(dirname "$0")/../.."
pnpm install --frozen-lockfile
pnpm build
rm -rf dist && mkdir -p dist/ai-departament-perevodchik
cp -R .output/chrome-mv3/. dist/ai-departament-perevodchik/
cp LICENSE dist/ai-departament-perevodchik/LICENSE.txt
cp AI-DEPARTAMENT.md dist/ai-departament-perevodchik/README.md
(cd dist && zip -qr ai-departament-perevodchik.zip ai-departament-perevodchik)
echo "Готово: dist/ai-departament-perevodchik.zip"
