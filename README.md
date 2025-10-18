# helm-library-manifests

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Custom manifests for nginx

To regenerate this document, from the root of this chart directory run:
```shell
docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest
```

## Prerequisites

- Prerequisites

## Installation

```console
$ helm install oci://registry..com/chart/<chart name> --version=<chart-version>
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMaps | list | `[]` |  |
| customResources | list | `[]` |  |
| dockerConfigs | list | `[]` |  |
| externalSecrets | list | `[]` |  |
| jenkinsCredentials | list | `[]` |  |


## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Surj Bains| <surj@polarpoint.io> |  |