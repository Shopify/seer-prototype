# SEER: Security Expert Elicitation of Risks

**This tool is a prototype only.**

SEER provides a tool for security experts to provide estimates of risk
for open source software.

## To run the software

First set up the assets and database:

```shell
$ bin/rails assets:precompule db:migrate db:seed
```

Seeding takes several minutes.

Second, run the rails process:

```shell
$ bin/rails server
```

There will now be a server listening at [localhost:3000](http://localhost:3000/).
