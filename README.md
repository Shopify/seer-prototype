# SEER: Security Expert Elicitation of Risks

**This tool is a PROTOTYPE ONLY. This is NOT an official or supported Shopify project.**

The SEER prototype is a tool for security experts to provide estimates of risk
for open source software. It is intended to demonstrate how a production-ready
service might work, but is not production-ready in itself.

The core of SEER inspired by [FAIR](https://www.fairinstitute.org/), which is
based on a Monte Carlo method. The main departure from FAIR (and similar
approaches like [Hubbard & Seiersen's](https://www.google.com/books/edition/How_to_Measure_Anything_in_Cybersecurity/AwD0BgAAQBAJ?hl=en)) is that SEER
can integrate _multiple_ estimates per subject of estimation.

Note well: there are no tests. These figures may be nonsense.

The version you are looking at continues to evolve, meaning that it will have
diverged from the version demoed in my [_How Do We Rank Project Risk?_](https://ossna2022.sched.com/event/e992f6daac4b7c79223c101ab9ec7de1) talk at
OS Summit North America 2022.
For convenience you may find [that version at this tag](https://github.com/Shopify/seer-prototype/tree/ranking-project-risk-presentation).

## To run the software

### Local development

First set up the assets and database:

```shell
$ bin/rails assets:precompile db:migrate db:seed
```

Seeding takes several minutes.

Second, run the rails process:

```shell
$ bin/rails server
```

There will now be a server listening at [localhost:3000](http://localhost:3000/).

### Containerised

If you prefer to use Docker or podman, you can build a container image.

For podman:
```shell
$ podman build . --tag seer
```

For Docker:
```shell
$ docker build . --tag seer
```

After building the image, you can run it.

For podman:
```shell
$ podman run -p 3000:3000 seer
```

For Docker:
```shell
$ docker run -p 3000:3000 seer
```

There will now be a server listening at [localhost:3000](http://localhost:3000/).

## How the core estimation calculation works

The user provides two three-point estimates (min, mode/likely, max), one
for frequency and one for magnitude. To produce a risk value, a sample is
taken from each and multiplied to calculate a risk amount. This is done a
million times to create an approximation of the combined distribution of
frequency and magnitude.

The Monte Carlo process is followed when an `Estimate` model is saved. The
`#create_scenario_bins` method is set to be called `after_save`.

`#create_scenario_bins` first clears existing estimate results from the DB.
It then creates `ThreePointEstimate` objects for each of the frequency and
magnitude estimate values given by the expert. These are passed into a
`Scenarios` object.

The `ThreePointEstimate` and `Scenarios` live in `app/helpers/estimates_helper.rb`.
The `ThreePointEstimate` class represents the three basic data points for the
estimate. Based on these it provides a `#sample` method, which takes a randomly
chosen value from a triangular distribution configured with the minimum, modal
and maximum values of the estimate. The triangular distribution sample is provided
by the [simple-random](https://github.com/ealdent/simple-random) gem. It's not
clear whether this is a CSRPNG, but it doesn't matter for our purposes.

Alongside `ThreePointEstimate` is `Scenarios`. The `Scenarios#sample` method performs
the process of repeatedly calling `ThreePointEstimate#sample` multiple times, as
set by the `number_of_samples` argument. `ThreePointEstimate#sample` is called
on the frequency estimate and on the magnitude estimate, and the results are
multiplied to get the risk for that scenario. Then the value is stored in an
array of risks.

Once this sampling loop is complete, `Scenarios#sample` converts the results
into a histogram with 100 bins. This is then munged into a convenient format,
which is an array of hashes of the form:
`{value: <boundary of bucket>, count: <number of results in bucket>}`.

Once control returns from `Scenarios#sample` to `Estimate#create_scenario_bins`,
the method creates 100 `ScenarioBin` model records to represent the 100 histogram
bins that were generated during the sampling process.

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
