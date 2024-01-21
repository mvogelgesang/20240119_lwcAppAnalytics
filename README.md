# lwcAppAnalytics

Provide a working example of an LWC invoking custom interaction log methods for App Analytics.

Acme Corp is offering new layouts for their components which show a list of records. As they have just started rolling out this functionality, they want to see whether users are switching to the new layout. The following example containts a Lightning Web Component, contactList, which offers two layouts: table and card. When the user switches between the layouts by pressing the appropriate button, an Apex call is made to log the event.

## TO DO

- add namespace to everything
- package it
- deploy it
- verify

## Packaging

`sf package create --name "lwcAppAnalytics" --path force-app --package-type Managed`

0HoHs000000blgrKAA

`sf package version create --package "lwcAppAnalytics" --code-coverage --installation-key password123 --wait 10`

`sf package version promote --package "lwcAppAnalytics@0.1.0-1"`

## Installation

password123

`sf org create scratch -f config/installation-scratch-def.json -a previewCustomInteraction -w 10 -y 30 -v DEVHUB`

`sf package `