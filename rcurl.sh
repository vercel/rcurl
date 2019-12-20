import "dns@1.0.0"

rcurl__debug() {
  echo "$@" | grep -w '\-v' >/dev/null || echo "$@" | grep -w '\-\-verbose' >/dev/null
}

rcurl_debug() {
  local msg="$1"
  shift
  rcurl__debug "$@" && echo "* rcurl - $msg" >&2 ||:
}

rcurl() {
  target="${1}"
  shift

  url="${1}"
  shift

  hostname="$(echo "${url}" | sed 's~http[s]*://~~g' | sed 's/[\?\/].*//')"
  rcurl_debug "Hostname: ${hostname}" "$@"

  port=80
  if echo "${url}" | grep -E -i '^https://' >/dev/null; then
    port=443
  fi
  rcurl_debug "Port:     ${port}" "$@"

  target_ip="$(dns_lookup "${target}" | head -1)"
  if [ -z "${target_ip}" ]; then
    # if dig returned nothing then is 127.0.0.1 or something
    target_ip="${target}"
  fi
  rcurl_debug "Target IP: ${target_ip}" "$@"

  rcurl_debug "Command:   curl --resolve ${hostname}:${port}:${target_ip} ${url} $*" "$@"
  curl --resolve "${hostname}:${port}:${target_ip}" "${url}" "$@"
}
