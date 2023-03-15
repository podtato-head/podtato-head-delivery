# Delivery scenarios for the podtato-head
Podtato-head is a cloud-native application built to colorfully demonstrate delivery scenarios using  different tools and services. It is intended to help application delivery support teams test and decide which of these to use. In this repository, you find a set of delivery scenarios for podtato-head.

## Use it
Find the following set of delivery scenarios in the delivery directory. Each example scenario delivers the same end result: an API service which communicates with other API services and returns HTML composed of all their responses.

Each delivery scenario includes a walkthrough (README.md) describing how to 

* install required supporting infrastructure 
* deliver podtato-head using the infrastructure
* And test that podtato-head is operating as expected.

Each delivery scenario also includes a test (test.sh) which automates the steps described in the walkthrough. You can pause a test after tests run and before teardown by setting the env var WAIT_FOR_DELETE=1, as in WAIT_FOR_DELETE=1 ./delivery/flux/test.sh. This lets you examine what the README and scripts do.
