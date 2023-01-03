# ace-unicode-characters

This repo contains artifacts that demonstrate the ability of App Connect Enterprise (ACE) 
v12 to geneate correct Unicode output for XML and JSON data. The main prereq is the ACE v12 
product, which can be downloaded from 
[the IBM website](https://www.ibm.com/marketing/iwm/iwm/web/pickUrxNew.do?source=swg-wmbfd)

## TraceInput application

This application prints out the input message to the server console as a BLOB and (optionally)
as JSON, showing the data received on the wire. This can be used to verify JSON data being 
received correctly, though care must be taken when interpreting the console output as the exact
JSON strings printed out will depend on the console codepage; the BLOB hex data is unaffected
by the codepage and should always reflect the data on the wire.

Note that actually sending Unicode data to the flow is not always simple: command-line tools 
such as curl may not send the expected data due to command shell conversion (or lack thereof)
and other issues. See the [TraceInput README](TraceInput/README.md) for more details.

## TMCharacter application

This application creates either XML or JSON strings containing the Unicode TM character (U+2122) 
as an example of how to create ACE message trees with Unicode data. The flows use ESQL to create
the tree, and then the HTTP Reply node serialises the data back to the waiting client. Tests also
verify the correctness of the flows without needing manual verification.

See the [TMCharacter README](TMCharacter/README.md) for more details, including instructions on 
using an ACE client flow to call the TraceInput application with Unicode data (avoiding the 
issues with command-line tools).

## Codespaces

Codespaces are a [feature of GitHub](https://github.com/features/codespaces) that enables
container-based development with VisualStudio Code in a web browser. The container in
which vscode runs is configurable, and this repo uses a container with ACE installed.

Individual developers get sixty hours of container runtime for free (at the time of
writing), and a codespace can be launched from the "Code" menu:

![Codespaces launch](/.devcontainer/codespaces-launch.png)

## Building and testing

The container will start up once the image has been downloaded (usually 30-50 seconds)
and vscode will start automatically. All of the usual ACE commands are present, servers
can be started as usual, etc. For this repo, the `build-and-ut.sh` script can be used
to build and run the tests.

## Codespace devcontainer

Codespaces for this repo use the [ace-minimal devcontainer](https://github.com/ot4i/ace-docker/tree/main/experimental/devcontainers)
which is built on the standard Ubuntu devcontainer with ACE and Maven installed. The container
is pre-built for faster startup, but could also be run as a docker build during codespace startup.
