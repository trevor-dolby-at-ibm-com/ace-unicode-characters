#!/bin/bash
#
# This script is a non-Maven way of building and testing the Unicode unit tests.
#
# Copyright (c) 2022 Open Technologies for Integration
# Licensed under the MIT license (see LICENSE for details)
#

# Create the work directory
mqsicreateworkdir /tmp/ace-unicode-characters-work-dir

# Old commands 
#mqsipackagebar -w . -a /tmp/TMCharacter.bar -k TMCharacter -t TMCharacter_UnitTest
#mqsibar -c -w /tmp/ace-unicode-characters-work-dir -a /tmp/TMCharacter.bar

# ibmint new for v12
ibmint deploy --input-path . --output-work-directory /tmp/ace-unicode-characters-work-dir --project TMCharacter --project TMCharacter_Test

# ibmint optimize server new for v12.0.4
ibmint optimize server --work-directory /tmp/ace-unicode-characters-work-dir

# Run the server to run the tests
IntegrationServer -w /tmp/ace-unicode-characters-work-dir --start-msgflows false --no-nodejs --admin-rest-api -1 --test-project TMCharacter_Test
