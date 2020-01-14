# Airtable Proof of Concept

Working with Airtable's APIs in Ruby

## Setting Airtable API key

Determine the API key for your account and set it as an environment variable:
```
> export AIRTABLE_API_KEY=your_api_key
```

This must be done within the Docker image if running via Docker.

## Running the PoC in Docker

```
> docker container rm air; \
    docker image rm airtable; \
    docker build -t airtable . && \
    docker run -it --name=air airtable:latest
# export AIRTABLE_API_KEY=your_api_key
# airtable-poc
```

## Commands

### `all`

```
> airtable-poc
```

or

```
> airtable-poc all
```

With a filter formula:

```
> airtable-poc all --filter="{Field Name} = \"value\""
```

All formula patterns supported by [formulaic fields](https://support.airtable.com/hc/en-us/articles/203255215-Formula-field-reference) are valid for filters.

### `find`

The `find` command expects an Airtable-generated record ID. IDs can be
found by using the `all` command with an appropriate filter function.

```
> airtable-poc find airtable_record_id
```

## Global Options

### `--base`

The `--base` option can be set with the Airtable-generated ID for the given
Base. This can be found in the Base's API documentation.

```
> airtable-poc all --base=airtable_base_id
```

### `--table`

The `--table` option can be set to the human-readable name of the Table as can
be found in the Base's UI.

```
> airtable-poc all --table="My Table Name"
```
