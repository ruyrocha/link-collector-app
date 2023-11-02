# README

The _Link Collector App_ scrapes the web to extract links on web pages.

## How can I run this cool piece of software?

You **must** have installed Redis for Sidekiq, and I think podman or docker provide you the easiest way to do it while developing, e.g:

```
podman run -d -p 6379:6379 --name redis redis:latest
```

## Concerns

The views are not so DRY and are lacking the use of view components.

