 Sensu Plugins Process Count Metrics
====================================

[![Build Status](https://travis-ci.com/ElvenSpellmaker/sensu-plugins-process-count-metrics.svg?branch=master)](https://travis-ci.com/ElvenSpellmaker/sensu-plugins-process-count-metrics) [![Gem Version](https://badge.fury.io/rb/sensu-plugins-process-count-metrics.svg)](https://badge.fury.io/rb/sensu-plugins-process-count-metrics)

This is a Sensu Plug-in to interface with `pgrep` and count the number of
processes with a given name as metrics.

Supply `-f` to use `-f` in `pgrep`.

This plug-in will ignore itself in the process list.

Tested on Ruby 2.3.

The unit tests are a bit dubious as they run the Ruby file externally as it's
almost impossible to run unit tests on a Sensu plug-in because they run as soon
as scoped...
The tests must be run from the project root directory.

`bundle exec rspec` should run the test, after bundle installing of course.
