# rcurl

`curl --resolve` helper script.

The `-v` flag also includes additional debugging information from `rcurl`:

```
$ rcurl staging-sfo1.vercel.com https://ip.vercel.app -v
* rcurl - Hostname:  ip.vercel.app
* rcurl - Port:      443
* rcurl - Target IP: 76.76.21.21
* rcurl - Command:   curl --resolve ip.vercel.app:443:76.76.21.21 https://ip.vercel.app -v
* Added ip.vercel.app:443:76.76.21.21 to DNS cache
* Hostname ip.vercel.app was found in DNS cache
*   Trying 76.76.21.21...
* TCP_NODELAY set
* Connected to ip.vercel.app (76.76.21.21) port 443 (#0)
```

## Install

[Install `import`](https://import.sh/docs/install), then add
this to your shell script or `.bashrc`/`.zshrc` file:

```bash
# Load the `import` function
. "$(which import)"

# Import the rcurl function
import "vercel/rcurl@2.0.2" # NOTE: replace with latest version
```

## Usage

```
rcurl $target $url [$options...]
```

Any `options` get passed directly to `curl`, so you can specify custom headers,
HTTP method, body, etc.

## Examples

``` bash
rcurl 127.0.0.1 https://vercel.com
rcurl alias-bru1.vercel.com https://vercel.com -v --header "Authorization: bearer $token"
```
