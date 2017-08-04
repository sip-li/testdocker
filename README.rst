testdocker
~~~~~~~~~~

Maintainer: Joe Black <joeblack949@gmail.com>

Repository: https://www.github.com/joeblackwaslike/testdocker

Description
-----------

Unit Testing for docker containers.


Local Usage:
------

* To create the `tests` directory, run the following form the root of your
  project folder: `testdocker init`
* Modify class attributes in `tests/tests.py` according to the directions in
  the docstrings.
* Add any additional tests as methods of the classes in the same style as
  :class:`unittest.TestCase`.
* Run tests with `tests/run local`.


Docker Usage:
------

* To create the `tests` directory, run the following from the root of your
  project folder:
.. code-block:: bash

  docker run -it --rm \
      -v $(pwd):/repos/app \
      callforamerica/testdocker \
      testdocker init

* Modify class attributes in `tests/tests.py` according to the directions in
  the docstrings.
* Add any additional tests as methods of the classes in the same style as
  :class:`unittest.TestCase`.
* Run tests with `tests/run`.
