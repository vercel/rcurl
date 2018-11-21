# rcurl

`curl --resolve` helper script.

The `-v` flag also includes additional debugging information from `rcurl`:

```
$ rcurl staging-sfo1.zeit.co https://ip.now.sh -v
* rcurl - Hostname:  ip.now.sh
* rcurl - Port:      443
* rcurl - Target IP: 52.52.221.208
* rcurl - Command:   curl --resolve ip.now.sh:443:52.52.221.208 https://ip.now.sh -v
* Added ip.now.sh:443:52.52.221.208 to DNS cache
* Rebuilt URL to: https://ip.now.sh/
* Hostname ip.now.sh was found in DNS cache
*   Trying 52.52.221.208...
* TCP_NODELAY set
* Connected to ip.now.sh (52.52.221.208) port 443 (#0)
```

## Install

[Install `import`](https://import.pw/importpw/import/docs/install.md), then add
this to your shell script or `.bashrc`/`.zshrc` file:

```bash
# Load the `import` function
. "$(which import)"

# Import the rcurl function
import "zeit/rcurl@2.0.0"
```

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
