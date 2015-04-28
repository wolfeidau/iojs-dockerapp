# iojs-dockerapp

This project is a simple base for building [iojs](https://iojs.org) (nodejs fork) based projects. It uses [mon](https://github.com/tj/mon) a simple c program written by tj to monitor and restart node processes.

# overview

This project has the following key features:

* Restarts iojs apps when they fail
* Uses a simple reliable process monitor which doesn't use a lot of resources
* Logs are emitted to `stdout` without any noise from the supervisor
* Application runs as an unprivileged user because security

This builds on the [docker-iojs](https://github.com/iojs/docker-iojs) but doesn't use the `onbuild` project as this is quite limited.

# recommendations

This project should be paired with:

* Some sort of performance monitoring tool like [newrelic](http://newrelic.com/) or [datadog](https://www.datadoghq.com).
* Something external should monitor the `/status` end point

# License

This code is Copyright (c) 2014 Mark Wolfe and licenced under the MIT licence. All rights not explicitly granted in the MIT license are reserved. See the included LICENSE file for more details.
