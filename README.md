# Issue

Test Kitchen converges work, but test runs fail.

## Testing environment

- Linux 4.4.5-1-ARCH x86_64 GNU/Linux
- Ruby 2.3.0
- Vagrant 1.8.1
  - vagrant-berkshelf (4.1.0)
  - vagrant-cachier (1.2.1)
  - vagrant-ohai (0.1.13)
  - vagrant-omnibus (1.4.1)

## Reproduction steps

### Setup

Get the code

```
$ git clone https://github.com/rxbugs/chef-docker-read_timeout.git
$ cd chef-docker-read_timeout
```

Install Ruby 2.3.0 if needed, e.g.,

```
$ rbenv install --skip-existing
```

Install dependencies with

```
$ bundle
$ berks
```

### Test run fails

Try to run the kitchen test suites with

```
$ kitchen test nginx
$ kitchen test php
```

These will fail.

### Converges successfully

Try to converge the nodes with

```
$ kitchen destroy
$ kitchen converge nginx
$ kitchen converge php
```

These will converge successfully.
