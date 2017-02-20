KubeWait Changelog
~~~~~~~~~~~~~~~~~~

0.2.5
-----

Feb 11, 2016
* Compose object now allows multiple compose files to be passed
* Mixin now waits for all containers
* Optimizations for speed


0.2.1
-----

Feb 11, 2016
* Small changes to the class names in mixins.
* Implemented a `container_ready` hook.  By supplying a class method by that name, testing will wait until that method returns True.
* Implemented a class attribute called `sleep_interval`.  When specified, this will be used as the interval of time to wait before retesting `container_ready`.


0.2.0
-----

Feb 2, 2016

* Initial commit
