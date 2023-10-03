# dumbfy-db

## Why?

Small project from my initial MySQL studies. The objective was to model a database prototype that would be used by a music streaming service, in addition to creating some queries for it.

## How to run this bank on your computer?

1. Make sure you have [Docker](https://docs.docker.com/engine/install/) installed and running on your machine.

2. In the terminal, ensuring nothing is listening on port 3306, run the following command:

```bash
docker run -p 3306:3306 --name dumbfy -d emersonfbarros/dumbfy-db:latest
```

4. Access the DB through your favorite SQL client through **localhost:3306** using the password **dumbpassword**.

## Check out the dumbfy-db EER diagram

![dumbfy-db EER diagram](./EER-dumb-fy-db-diagram.png)