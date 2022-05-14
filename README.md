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

## Copyright License

This repository is licensed under the Apache v2 License:

```
Copyright 2022-Present Shopify, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
