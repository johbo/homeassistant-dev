# Development utilities Home Assistant

## Voice

The idea is to run the voice components so that they can be integrated with a
locally running devcontainer of Home Assistant.

## Dependencies and development environment

### Dependencies via compose

Needed services are configured in the file `docker-compose.yaml`. They can be
started as follows:

```console
docker compose up
```

### Dev environment for Home Assistant

A Nix based environment is defined in `flake.nix` and can be entered as follows:

```console
nix develop
```

This shell brings all needed dependencies so that a virtual environment for the
codebase can be created.


## Home Assistant code base

Initial setup in a directory with the cloned code base:

```console
script/setup
```

Use the environment:

```console
source venv/bin/activate

hass -c config/
```


### SIP Soft Phones

#### Jitsi Desktop

Not sure which settings are required, with the following setup it did work
locally:

- Change the SIP client ports to 5070 and 5071 in advanced settings.
- Disabled presence in SIP configuration.
- Disabled security in SIP configuration.
- Disabled Voicemail WMI in SIP configuration.
- Changed DTMF method to inband.

### Pointers

- <https://developers.home-assistant.io/docs/development_environment#setup-local-repository>


### Configuration in Home Assistant for VoIP

- Integration: VoIP
  - Port: `5060`
- Integration: Wyoming
  - `faster-whisper`
    - Host: `localhost`
    - Port: `10300`
  - `piper`
    - Host: `localhost`
    - Port: `10200`
  - `openwakeword`
    - Host: `localhost`
    - Port: `10400`

Configure the assistant to use the components which have been added above.

Make a call from the SIP Phone to Home Assistant: `sip:127.0.0.1:5060`. Adjust
the IP when calling from a different machine or device. Then adjust the
configuration of the phone to allow it to make calls.

Calling again should now trigger the voice prompt.
