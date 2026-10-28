# Свой образ на основе официального PostgreSQL.
# "Кастомное внутри": вшиваем SQL-скрипт, который при первом запуске
# сам создаёт таблицу users и заливает 20 записей.
FROM postgres:16-alpine

LABEL maintainer="x100kaioken"
LABEL description="PostgreSQL с предзагруженной базой пользователей (СРО)"

# Всё, что лежит в этой папке образа, PostgreSQL выполняет при инициализации.
COPY init/01_init.sql /docker-entrypoint-initdb.d/01_init.sql

# База, которая создаётся при старте
ENV POSTGRES_DB=company
ENV POSTGRES_USER=admin

# Пароль по умолчанию (для учебного задания). Можно переопределить при docker run.
ENV POSTGRES_PASSWORD=secret123

EXPOSE 5432
