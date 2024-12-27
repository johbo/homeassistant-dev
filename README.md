# Development utilities Home Assistant

## Voice

The idea is to run the voice components so that they can be integrated with a
locally running devcontainer of Home Assistant.

## Dependencies via compose

Needed services are configured in the file `docker-compose.yaml`. They can be
started as follows:

```console
docker compose up
```

## Dev environment for Home Assistant

A Nix based environment is defined in `flake.nix` and can be entered as follows:

```console
nix develop
```
