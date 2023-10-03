FROM mysql:8.0.34

ENV MYSQL_DATABASE=dumbfy
ENV MYSQL_ROOT_PASSWORD=dumbpassword

ADD ./db/dumbfy-db.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
