---
draft: false
aliases: ["/en/"]
---

# Conventional Logs v0.0.1

## Summary

The conventional logs specification is an opinionated convention
aiming to set an industry standard to ensure search-ability
and enhance security in logs.

Each log entry could be encoded in different formats, `json`, `xml`, or even a custom one.
Most of the examples in this page will be written as `json`.

A basic log entry should be structured as follows:

---

```
{
  "severity": "DEBUG",
  "scope": "web-app",
  "message": "could not save the user",
  "timestamp": "2022-05-14T14:16:15+00:00"
}
```

---

A minimal log entry is composed by the following fields,
and needs to be descriptive enough to determine the context related to event occurrence.

1. The `severity`, also referred as `level`, describes the importance of a log entry.
   Starting from the lower priority to the higher one, the recommended levels are ***debug***, ***info***,
   ***warning*** (or ***warn***), ***error***, ***fatal***.
1. Other values as `severity` can be used, but it is recommended to stick to the suggested one.
1. The `scope` field represents the issuer of the log entry.
   This is useful especially in contexts where a log entry may be created from multiple services.
1. In complex systems the `scope` could also point to the node/service that caused the log entry.
1. The `message` is the core information of a log entry, and describes an event that occurred in a system.
1. When the same event happens multiple times, the `message` must always be the same and other fields must be used as
   discriminant.
1. The `timestamp` field determines when a log entry has been created and contains date+time, it is optional to pass
   timezone information as well.
1. Each of fields can be renamed and adapted to a company need. An example: `message` may be reported as `event`
    or `msg` etc.
1. The conventional log specification encourages adding more custom fields to better describe the log entry.
1. Sensible data, such as customer information ([PII](https://en.wikipedia.org/wiki/Personal_data)),
    auth token or any other secret must not be added to the entry.

## Specification

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and
“OPTIONAL” in this document are to be interpreted as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

When the same event happens multiple times, the message must always be the same and other fields must be used as
discriminant.

1. A field for the `message` MUST be provided in each log entry.
1. The content of a `message` field MUST be a description of an event occurrence.
1. The content of the `message` field SHOULD be unique within your system.
1. The content of the `message` field MUST NOT contain variable content and MUST be a static.
1. The `message` field MAY be named differently.
1. A field for the `timestamp` MUST be provided in each log entry.
1. The content of the `timestamp` field MUST include year, month, day, hour, minute, second, and millisecond of the
   event occurrence.
1. The content of the `timestamp` field MAY include a timezone information.
1. The `timestamp` field MAY be named differently.
1. A field for the `severity` MUST be provided in each log entry.
1. The `severity` field MAY be named differently.
1. The content of the `severity` field SHOULD be one of ***debug***, ***info***, ***warning*** (or ***warn***),
    ***error***, ***fatal***.
1. The content of the `severity` field MUST be all lowercase or uppercase.
1. A ***debug*** `severity` SHOULD be used only for debugging purposes.
1. An ***info*** `severity` SHOULD ....
1. A ***warning*** `severity` (or ***warn***) SHOULD report an event may cause problem to an application but that
    still does not affect the user directly.
1. An ***error*** `severity` SHOULD be used when an event needs attention
    because it affects the user of the application in a disruptive way.
1. A ***fatal*** `severity` SHOULD flag an entry that caused an application to crash or terminate.
1. A field for the `scope` SHOULD be provided.
1. The content of a `scope` field MUST be a reference to the creator of the log.
1. The `scope` field MAY be named differently.
1. Further entry fields SHOULD be added to a log entry to better.
1. The log entry fields MUST NOT contain any application secret.
1. The log entry fields MUST NOT contain any sensible customer
    data ([PII](https://en.wikipedia.org/wiki/Personal_data)).
1. The log entry fields MAY be encoded in different formats.
1. It is RECOMMENDED to add tracing information to a log entry.
1. The log entry fields SHOULD not contain duplicated fields.

## Examples

### A log entry with different valid fields

```
[
  {
    "severity": "WARN",
    "scope": "web-app",
    "message": "connection to database reset",
    "timestamp": "2022-05-14T14:16:15+00:00",
    "fields.trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
  }
]
```

```
[
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:10"
  }
]
```

```
[
  {
    "level": "ERROR",
    "node": "web-app",
    "event": "could not save the user",
    "occurred_at": "2022-05-14T14:16:15+00:10",
    "fields": {
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  }
]
```

```
[
  {
    "level": "ERROR",
    "node": "web-app",
    "event": "could not save the user",
    "occurred_at": "2022-05-14T14:16:15+00:10",
    "fields": {
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  }
]
```

### A log entry with a *fields* field containing a *trace_id* field to collect common logs

***DO***

```
[
  {
    "severity": "WARN",
    "scope": "web-app",
    "message": "connection to database reset",
    "timestamp": "2022-05-14T14:16:15+00:00",
    "fields": {
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  },
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:10",
    "fields": {
      "trace_id": "269c2bd4-1b5f-4214-a097-b94ced4d1c48"
    }
  },
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:10",
    "fields": {
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  }
]
```

***DON'T***

```
[
  {
    "severity": "WARN",
    "scope": "web-app",
    "message": "connection to database reset",
    "timestamp": "2022-05-14T14:16:15+00:00"
  },
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:10"
  },
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:10"
  }
]
```

### A log entry with a *fields* section that contains a discriminant field (user_id) which allows having searchable log messages

***DO***

```
[
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:00",
    "fields": {
      "user_id": "75ff9dea-2a37-425e-b99d-20667124c586",
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  },
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:10",
    "fields": {
      "user_id": "646f7513-97e0-4225-a5bb-ff766a5998de",
      "trace_id": "38f99337-5b72-4e5c-ab06-9c8d4fcbd5be"
    }
  }
]
```

***DON'T***

```
[
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user 75ff9dea-2a37-425e-b99d-20667124c586 in the database",
    "timestamp": "2022-05-14T14:16:15+00:00"
  },
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user 646f7513-97e0-4225-a5bb-ff766a5998de in the database",
    "timestamp": "2022-05-14T14:16:15+00:10"
  }
]
```

### A log entry with sensible data

***DO***

```
[
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:00",
    "fields": {
      "user_id": "75ff9dea-2a37-425e-b99d-20667124c586",
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  }
]
```

***DON'T***

```
[
  {
    "severity": "ERROR",
    "scope": "web-app",
    "message": "could not save the user",
    "timestamp": "2022-05-14T14:16:15+00:00",
    "fields": {
      "user_id": "75ff9dea-2a37-425e-b99d-20667124c586",
      "email": "user@domain.com",
      "name": "John Smith",
      "address": "Vere Street 21B",
      "trace_id": "438c908b-3baf-4374-84ad-eaed7b0faedd"
    }
  }
]
```
