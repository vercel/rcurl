# rcurl

`curl --resolve` helper script.

## Usage

```
rcurl $target $url [$options...]
```

Any `options` get passed directly to `curl`, so you can specify custom headers,
HTTP method, body, etc.

## Examples

``` bash
curl 127.0.0.1 https://zeit.co
curl alias-bru1.zeit.co https://zeit.co -v --header "Authorization: bearer $token"
```
