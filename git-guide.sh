#!/bin/bash

# Ультимативный Гайд по Git (версия 4.0)
# Полное руководство со всеми командами Git

cat << "EOF"

  _________.__       .__  __    ___________.__                 
 /   _____/|__| ____ |__|/  |_  \_   _____/|__| ____    ____   
 \_____  \ |  |/ ___\|  \   __\  |    __)  |  |/    \  / ___\  
 /        \|  / /_/  >  ||  |    |     \   |  |   |  \/ /_/  > 
/_______  /|__\___  /|__||__|    \___  /   |__|___|  /\___  /  
        \/   /_____/                 \/            \//_____/   

EOF

# Разделитель
print_section() {
    echo -e "\n\033[1;34m$1\033[0m"
    echo "=================================================="
}

# Команда с описанием
git_command() {
    echo -e "\n\033[1;32m$1\033[0m"
    echo -e "   \033[0;37m$2\033[0m"
    [ -n "$3" ] && echo -e "   Пример: \033[0;33m$3\033[0m"
}

# 1. НАСТРОЙКА И КОНФИГУРАЦИЯ
print_section "1. НАСТРОЙКА И КОНФИГУРАЦИЯ"

git_command "git config --global user.name 'Имя'" \
"Установка имени пользователя для всех репозиториев"

git_command "git config --global user.email 'email'" \
"Установка email пользователя"

git_command "git config --global core.editor 'nano'" \
"Установка текстового редактора по умолчанию"

git_command "git config --global alias.st 'status'" \
"Создание псевдонима для команды"

git_command "git config --global color.ui auto" \
"Включение цветного вывода"

git_command "git config --global core.autocrlf input" \
"Настройка обработки концов строк (Linux/Mac)"

git_command "git config --global core.excludesfile ~/.gitignore_global" \
"Указание глобального файла .gitignore"

git_command "git config --global credential.helper 'cache --timeout=3600'" \
"Кэширование учетных данных на 1 час"

git_command "git config --global push.default simple" \
"Настройка поведения push по умолчанию"

git_command "git config --global pull.rebase true" \
"Автоматический rebase при выполнении pull"

git_command "git config --list" \
"Просмотр всех настроек конфигурации"

# 2. СОЗДАНИЕ И КЛОНИРОВАНИЕ РЕПОЗИТОРИЕВ
print_section "2. СОЗДАНИЕ И КЛОНИРОВАНИЕ РЕПОЗИТОРИЕВ"

git_command "git init" \
"Инициализация нового локального репозитория" \
"git init my-project"

git_command "git init --bare" \
"Создание чистого репозитория (без рабочей директории)" \
"git init --bare project.git"

git_command "git clone <url>" \
"Клонирование удаленного репозитория" \
"git clone https://github.com/user/repo.git"

git_command "git clone --depth 1 <url>" \
"Поверхностное клонирование (только последний коммит)" \
"git clone --depth 1 https://github.com/user/repo.git"

git_command "git clone --branch <branch> <url>" \
"Клонирование определенной ветки" \
"git clone --branch develop https://github.com/user/repo.git"

git_command "git clone --recursive <url>" \
"Рекурсивное клонирование с подмодулями"

# 3. ОСНОВНЫЕ КОМАНДЫ РАБОЧЕГО ПРОЦЕССА
print_section "3. ОСНОВНЫЕ КОМАНДЫ РАБОЧЕГО ПРОЦЕССА"

git_command "git status" \
"Показать состояние рабочей директории и индекса"

git_command "git status -s" \
"Краткий формат статуса" \
"git status -s"

git_command "git add <file>" \
"Добавить файл в индекс" \
"git add index.html"

git_command "git add ." \
"Добавить все измененные и новые файлы"

git_command "git add -u" \
"Добавить все отслеживаемые измененные файлы"

git_command "git add -p" \
"Интерактивное добавление изменений" \
"git add -p"

git_command "git rm <file>" \
"Удалить файл из индекса и рабочей директории" \
"git rm old-file.txt"

git_command "git rm --cached <file>" \
"Удалить файл из индекса, но оставить в рабочей директории" \
"git rm --cached secret.txt"

git_command "git mv <old> <new>" \
"Переименовать файл" \
"git mv old-name.txt new-name.txt"

git_command "git commit -m 'Сообщение'" \
"Создать коммит с сообщением" \
"git commit -m 'Исправлена ошибка'"

git_command "git commit -a -m 'Сообщение'" \
"Добавить все измененные файлы и создать коммит" \
"git commit -a -m 'Обновление'"

git_command "git commit --amend" \
"Изменить последний коммит" \
"git commit --amend -m 'Новое сообщение'"

git_command "git commit --allow-empty -m 'Сообщение'" \
"Создать пустой коммит"

# 4. РАБОТА С ВЕТКАМИ
print_section "4. РАБОТА С ВЕТКАМИ"

git_command "git branch" \
"Показать список локальных веток"

git_command "git branch -a" \
"Показать все ветки (локальные и удаленные)"

git_command "git branch <branch>" \
"Создать новую ветку" \
"git branch feature-auth"

git_command "git branch -d <branch>" \
"Удалить локальную ветку" \
"git branch -d old-feature"

git_command "git branch -D <branch>" \
"Принудительно удалить локальную ветку"

git_command "git branch -m <new-name>" \
"Переименовать текущую ветку" \
"git branch -m new-feature-name"

git_command "git branch --merged" \
"Показать ветки, слитые в текущую"

git_command "git branch --no-merged" \
"Показать ветки, не слитые в текущую"

git_command "git checkout <branch>" \
"Переключиться на ветку" \
"git checkout develop"

git_command "git checkout -b <new-branch>" \
"Создать и переключиться на новую ветку" \
"git checkout -b hotfix"

git_command "git checkout -b <branch> origin/<branch>" \
"Создать локальную ветку для удаленной"

git_command "git switch <branch>" \
"Переключиться на ветку (Git 2.23+)" \
"git switch main"

git_command "git switch -c <new-branch>" \
"Создать и переключиться на новую ветку (Git 2.23+)"

# 5. СЛИЯНИЕ И ПЕРЕБАЗИРОВАНИЕ
print_section "5. СЛИЯНИЕ И ПЕРЕБАЗИРОВАНИЕ"

git_command "git merge <branch>" \
"Слить ветку в текущую" \
"git merge feature"

git_command "git merge --no-ff <branch>" \
"Слить ветку с созданием коммита слияния"

git_command "git rebase <branch>" \
"Перебазировать текущую ветку на другую" \
"git rebase main"

git_command "git rebase -i <commit>" \
"Интерактивное перебазирование" \
"git rebase -i HEAD~3"

git_command "git rebase --continue" \
"Продолжить перебазирование после разрешения конфликта"

git_command "git rebase --abort" \
"Отменить перебазирование"

git_command "git mergetool" \
"Запустить инструмент для разрешения конфликтов"

# 6. РАБОТА С ИСТОРИЕЙ
print_section "6. РАБОТА С ИСТОРИЕЙ"

git_command "git log" \
"Показать историю коммитов"

git_command "git log --oneline" \
"Краткая история коммитов" \
"git log --oneline"

git_command "git log --graph" \
"Визуализировать историю с ветвлением" \
"git log --graph --all"

git_command "git log -p" \
"Показать историю с изменениями" \
"git log -p"

git_command "git log -S 'текст'" \
"Поиск коммитов по содержанию" \
"git log -S 'function_name'"

git_command "git log --since='1 week ago'" \
"Фильтр по дате" \
"git log --since='2023-01-01'"

git_command "git blame <file>" \
"Показать автора каждой строки файла" \
"git blame app.js -L 10,20"

git_command "git show <commit>" \
"Показать информацию о коммите" \
"git show abc123"

git_command "git diff" \
"Показать изменения в рабочей директории"

git_command "git diff --staged" \
"Показать изменения в индексе"

git_command "git diff <commit1> <commit2>" \
"Сравнить два коммита" \
"git diff abc123 def456"

# 7. РАБОТА С УДАЛЕННЫМИ РЕПОЗИТОРИЯМИ
print_section "7. РАБОТА С УДАЛЕННЫМИ РЕПОЗИТОРИЯМИ"

git_command "git remote" \
"Показать список удаленных репозиториев" \
"git remote -v"

git_command "git remote add <name> <url>" \
"Добавить удаленный репозиторий" \
"git remote add origin https://github.com/user/repo.git"

git_command "git remote remove <name>" \
"Удалить удаленный репозиторий" \
"git remote remove origin"

git_command "git remote rename <old> <new>" \
"Переименовать удаленный репозиторий"

git_command "git remote show <name>" \
"Показать информацию об удаленном репозитории" \
"git remote show origin"

git_command "git fetch <remote>" \
"Получить изменения с удаленного репозитория" \
"git fetch origin"

git_command "git fetch --prune" \
"Получить изменения и удалить устаревшие ссылки"

git_command "git pull <remote> <branch>" \
"Получить изменения и слить с текущей веткой" \
"git pull origin main"

git_command "git push <remote> <branch>" \
"Отправить изменения в удаленный репозиторий" \
"git push origin feature"

git_command "git push -u <remote> <branch>" \
"Отправить и установить отслеживание ветки" \
"git push -u origin main"

git_command "git push --force" \
"Принудительная отправка изменений (перезапись истории)"

git_command "git push --delete <remote> <branch>" \
"Удалить удаленную ветку" \
"git push origin --delete old-branch"

git_command "git push --tags" \
"Отправить все теги"

# 8. ТЕГИ
print_section "8. РАБОТА С ТЕГАМИ"

git_command "git tag" \
"Показать список тегов"

git_command "git tag <tagname>" \
"Создать легковесный тег" \
"git tag v1.0"

git_command "git tag -a <tagname> -m 'Сообщение'" \
"Создать аннотированный тег" \
"git tag -a v1.1 -m 'Релиз версии 1.1'"

git_command "git tag -d <tagname>" \
"Удалить локальный тег" \
"git tag -d v0.9"

git_command "git show <tagname>" \
"Показать информацию о теге" \
"git show v1.0"

git_command "git push origin <tagname>" \
"Отправить тег в удаленный репозиторий" \
"git push origin v1.0"

git_command "git push origin --tags" \
"Отправить все теги"

git_command "git checkout <tagname>" \
"Переключиться на состояние тега (детектированная HEAD)" \
"git checkout v1.0"

# 9. ОТМЕНА ИЗМЕНЕНИЙ
print_section "9. ОТМЕНА ИЗМЕНЕНИЙ"

git_command "git restore <file>" \
"Откатить изменения в файле (Git 2.23+)" \
"git restore index.html"

git_command "git restore --staged <file>" \
"Убрать файл из индекса" \
"git restore --staged file.txt"

git_command "git reset --soft <commit>" \
"Откат к коммиту с сохранением изменений в индексе" \
"git reset --soft HEAD~1"

git_command "git reset --mixed <commit>" \
"Откат к коммиту с сохранением изменений в рабочей директории (по умолчанию)"

git_command "git reset --hard <commit>" \
"Полный откат к коммиту (потеря изменений)" \
"git reset --hard abc123"

git_command "git revert <commit>" \
"Создать коммит, отменяющий изменения" \
"git revert abc123"

git_command "git clean -f" \
"Удалить неотслеживаемые файлы"

git_command "git clean -fd" \
"Удалить неотслеживаемые файлы и директории"

git_command "git checkout -- <file>" \
"Откатить изменения в файле (до Git 2.23)" \
"git checkout -- config.js"

# 10. ПРОДВИНУТЫЕ ТЕХНИКИ
print_section "10. ПРОДВИНУТЫЕ ТЕХНИКИ"

git_command "git stash" \
"Временно сохранить изменения" \
"git stash save 'Работа над фичей'"

git_command "git stash list" \
"Показать список сохранений"

git_command "git stash pop" \
"Восстановить последнее сохранение" \
"git stash pop"

git_command "git stash apply" \
"Восстановить сохранение без удаления из списка"

git_command "git stash drop" \
"Удалить сохранение"

git_command "git cherry-pick <commit>" \
"Перенести коммит в текущую ветку" \
"git cherry-pick abc123"

git_command "git bisect start" \
"Начать бинарный поиск бага" \
"git bisect start\n"\
"git bisect bad\n"\
"git bisect good v1.0"

git_command "git bisect reset" \
"Завершить бинарный поиск"

git_command "git submodule add <url>" \
"Добавить подмодуль" \
"git submodule add https://github.com/user/lib.git"

git_command "git submodule update --init --recursive" \
"Инициализировать и обновить подмодули"

git_command "git worktree add <path> <branch>" \
"Добавить дополнительную рабочую область" \
"git worktree add ../hotfix hotfix-branch"

git_command "git reflog" \
"Показать журнал ссылок (историю изменений HEAD)"

git_command "git fsck" \
"Проверить целостность базы данных Git"

git_command "git gc" \
"Оптимизировать репозиторий (сборка мусора)"

git_command "git archive --format zip --output release.zip main" \
"Создать архив репозитория"

# 11. ИНСТРУМЕНТЫ И ЛУЧШИЕ ПРАКТИКИ
print_section "11. ИНСТРУМЕНТЫ И ЛУЧШИЕ ПРАКТИКИ"

echo -e "\n\033[1;35m.gitignore:\033[0m"
echo "Файл для исключения файлов из отслеживания:"
echo "  *.log"
echo "  node_modules/"
echo "  .env"
echo "  .DS_Store"

echo -e "\n\033[1;35mСтандарт сообщений коммитов (Conventional Commits):\033[0m"
echo "  feat: Новая функциональность"
echo "  fix: Исправление ошибки"
echo "  docs: Изменения документации"
echo "  style: Форматирование кода"
echo "  refactor: Рефакторинг кода"
echo "  test: Добавление тестов"
echo "  chore: Вспомогательные задачи"

echo -e "\n\033[1;35mРабочие процессы:\033[0m"
echo "  • Git Flow: строгий процесс с фиксированными ветками"
echo "  • GitHub Flow: упрощенный процесс для непрерывного развертывания"
echo "  • GitLab Flow: процесс с окружениями развертывания"

echo -e "\n\033[1;35mПолезные инструменты:\033[0m"
echo "  • tig: TUI для просмотра истории Git"
echo "  • lazygit: современный TUI для Git"
echo "  • git-extras: дополнительные команды Git"
echo "  • diff-so-fancy: улучшенный вывод git diff"
echo "  • gitk: графический просмотр истории"

echo -e "\n\033[1;35mРекомендуемые ресурсы:\033[0m"
echo "  • Официальная документация: https://git-scm.com/doc"
echo "  • Learn Git Branching: https://learngitbranching.js.org/"
echo "  • Git Flight Rules: https://github.com/k88hudson/git-flight-rules"
echo "  • Pro Git Book: https://git-scm.com/book/en/v2"

# ЗАКЛЮЧЕНИЕ
echo -e "\n\033[1;32mУспешной работы с Git!\033[0m"
echo "Для глубокого изучения читайте документацию: https://git-scm.com/book"
