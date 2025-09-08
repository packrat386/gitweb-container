gitweb-container
---

A containerized installation of gitweb. WIP

See: https://git-scm.com/docs/gitweb

## Running

```
docker build .
docker run -ti --rm -v /bunch/of/repos:/pub/git -p 8080:80 <that sha> caddy run --config /etc/caddy/Caddyfile
```
