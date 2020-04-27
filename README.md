# sap-cds-business-service
Business Service using Node.js

## Before start

- Set the `npm` registry for `@sap` packages by executing the statement below at the command line

```
npm set @sap:registry=https://npm.sap.com
```

- Install `cds-dk` the enable the proper cds support.

```
npm i -g @sap/cds-dk
```

Check if the installation was successful by executing `cds version`

- Make sure the `@sap/cds` is installed

```
npm install @sap/cds
```


## Create a new project 

Create a new project by typing the statement below at the command line in any directory. It will imply in a creation of a new cds project with their default elements.

```
cds init ${PROJECT_NAME}
```

## Start the cds server-side process 

```
cds watch
```

## Getting Started

It contains these folders and files, following our recommended project layout:

File / Folder  | Purpose
---------------|----------
`app/`         | content for UI frontends go here
`db/`          | your domain models and data go here
`srv/`         | your service models and code go here
`package.json` | project metadata and configuration
`readme.md`    | this getting started guide


### Next Steps...

- Open a new terminal and run  `cds watch`
- ( in VSCode simply choose _**Terminal** > Run Task > cds watch_ )
- Start adding content, e.g. a [db/schema.cds](db/schema.cds), ...


### Learn more...

Learn more at https://cap.cloud.sap/docs/get-started/
