# Seed

Back-end for Seed application.

## Usage

### Commands


| Commands                                                           | Description                             |
| ------------------------------------------------------------------ | --------------------------------------- |
| **Crystal commands**                                               |                                         |
| `shards install`                                                   | Install dependencies                    |
| `crystal build src/seed.cr --release`                              | Build the application in release mode   |
| `crystal run src/seed.cr`                                          | Run the application                     |
| **Database commands**                                              |                                         |
| `createdb {db_name}`                                               | Postgresql command to create a database |
| `crystal run database/cli.cr -- migrate`                           | Setup the database                      |
| `crystal run databbase/cli.cr -- seed`                             | Populate the database                   |
| **Development commands**                                           |                                         |
| `./spy`                                                            | Start the application with hot reload   |
| `crystal run database/cli.cr -- generate migration migration_name` | Generate a new migration                |
| `crystal run database/cli.cr -- generate model model_name`         | Generate a new model & a new migration  |

### Environment

In development, we are using [envcr](https://github.com/dlacreme/env.cr) to manage the variables. Please see 'env.yml.example' to a valid 'env.yml' file.

| Variable name | Description                                                                     | Default                                 |
| ------------- | ------------------------------------------------------------------------------- | --------------------------------------- |
| SEED_PROD     | Define if the application is running in production mode                         | false                                   |
| SEED_SECRET   | The secret key of your application                                              | toto4242                                |
| KEMAL_ENV     | Define if kemal is running in production or not. Use 'production' in production | development                             |
| DATABASE_URI  | The URI of your postgresql database                                             | postgres://seed:toto@localhost/seed_dev |


## Development

### Install

```shell
$ chmod +x ./spy
$ shards install
$ createdb seed_dev
$ crystal run db/cli.cr -- migrate
$ crystal run db/cli.cr -- seed
```

### Run in dev mode

```shell
$ ./spy
```

### Database

We are using [Clear ORM](https://clear.gitbook.io/project/). Please read its manual before doing anything related to the database.

Clear cli is available in `db/cli.cr`. Use it as follow:
```shell
$ crystal run database/cli.cr -- {cmd}
```
*See Commands section for more useful commands*

## Contributing

1. [Clone it](https://github.com/Dlacreme/Seed-api)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Mathieu Delacroix](https://github.com/dlacreme) - creator and maintainer
