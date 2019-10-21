# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Also export non-system users SSH keys;
- Report users SSH public keys as a single `Hash[String, Array[String]]`
  `ssh_user_public_keys` instead of only reporting RSA keys as `<user>_key`.

## [1.0.0] - 2016-11-02
### Initial release

[Unreleased]: https://github.com/opus-codium/puppet-dehydrated/compare/1.0.0...master
