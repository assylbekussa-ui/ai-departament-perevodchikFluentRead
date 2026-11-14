#!/usr/bin/env bash
# Подтянуть свежий FluentRead (upstream) в этот форк
set -euo pipefail
cd "$(dirname "$0")/../.."
git remote get-url upstream >/dev/null 2>&1 || git remote add upstream https://github.com/FluentRead/FluentRead.git
git fetch upstream main
git merge --no-edit upstream/main
echo "Слито. Проверьте сборку (scripts/ai-departament/build.sh) и сделайте git push."
