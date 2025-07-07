# Changelog

## [3.1.0](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v3.0.0...v3.1.0) (2025-07-07)


### Features

* **deps:** bump github.com/cloudnationhq/az-cn-go-validor in /tests ([#20](https://github.com/CloudNationHQ/terraform-azure-sub/issues/20)) ([7a2defc](https://github.com/CloudNationHQ/terraform-azure-sub/commit/7a2defcb96e7ed61def943ff3ae42bd445212903))


### Bug Fixes

* fix subscription output to include existing ones ([#30](https://github.com/CloudNationHQ/terraform-azure-sub/issues/30)) ([0d8d26a](https://github.com/CloudNationHQ/terraform-azure-sub/commit/0d8d26ab5199d140d69bd452fa1c644df1e6eb56))

## [3.0.0](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v2.3.1...v3.0.0) (2025-07-04)


### ⚠ BREAKING CHANGES

* The data structure changed, causing a recreate on existing resources.

### Features

* add support for existing subscriptions ([#28](https://github.com/CloudNationHQ/terraform-azure-sub/issues/28)) ([8cd4750](https://github.com/CloudNationHQ/terraform-azure-sub/commit/8cd475044e6ae45c522b01a0e98a3af7f51f1c3f))

### Upgrade from v2.3.1 to v3.0.0:

- Update module reference to: `version = "~> 3.0"`
  - The keys on some resources changed, which will cause recreates.

## [2.3.1](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v2.3.0...v2.3.1) (2025-06-17)


### Reverts

* return to v2.1.0 state ([#26](https://github.com/CloudNationHQ/terraform-azure-sub/issues/26)) ([825db3b](https://github.com/CloudNationHQ/terraform-azure-sub/commit/825db3b7e30c0cb6de806a8bbd27fa81fce3f334))

## [2.1.0](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v2.0.1...v2.1.0) (2025-06-12)


### Features

* replace deployment test code with module consumption and fix tags property idempotence ([#15](https://github.com/CloudNationHQ/terraform-azure-sub/issues/15)) ([77529f5](https://github.com/CloudNationHQ/terraform-azure-sub/commit/77529f59405de6f5e5ca352a62d84f7a62cd5e04))

## [2.0.1](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v2.0.0...v2.0.1) (2025-04-14)


### Bug Fixes

* fix submodule generation from makefile ([#12](https://github.com/CloudNationHQ/terraform-azure-sub/issues/12)) ([ffeb78d](https://github.com/CloudNationHQ/terraform-azure-sub/commit/ffeb78d0914d3d62d87b40022e95262d9094d001))

## [2.0.0](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v1.2.0...v2.0.0) (2025-03-20)


### ⚠ BREAKING CHANGES

* refactor to single resource without a for_each ([#10](https://github.com/CloudNationHQ/terraform-azure-sub/issues/10))

### Features

* refactor to single resource without a for_each ([#10](https://github.com/CloudNationHQ/terraform-azure-sub/issues/10)) ([319e496](https://github.com/CloudNationHQ/terraform-azure-sub/commit/319e496c9bb5c6ef7e87229798e1136483fd392c))

## [1.2.0](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v1.1.0...v1.2.0) (2025-03-18)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#4](https://github.com/CloudNationHQ/terraform-azure-sub/issues/4)) ([5ee2c2f](https://github.com/CloudNationHQ/terraform-azure-sub/commit/5ee2c2f6402347ac64108c2a5c506d8d5f227875))
* update documentation ([#8](https://github.com/CloudNationHQ/terraform-azure-sub/issues/8)) ([8b8947e](https://github.com/CloudNationHQ/terraform-azure-sub/commit/8b8947e97c82ddf5695396d01eca6539ea8dcc7a))

## [1.1.0](https://github.com/CloudNationHQ/terraform-azure-sub/compare/v1.0.0...v1.1.0) (2025-03-18)


### Features

* **deps:** bump golang.org/x/crypto from 0.21.0 to 0.31.0 in /tests ([#3](https://github.com/CloudNationHQ/terraform-azure-sub/issues/3)) ([528f8e8](https://github.com/CloudNationHQ/terraform-azure-sub/commit/528f8e80450ef019c2099581e67a3e972f2e5fb8))
* **deps:** bump golang.org/x/net from 0.23.0 to 0.36.0 in /tests ([#5](https://github.com/CloudNationHQ/terraform-azure-sub/issues/5)) ([6aab40a](https://github.com/CloudNationHQ/terraform-azure-sub/commit/6aab40aeddb7babbdbb96e1dec953c9215141bd7))
* switch to document style to include type definitions in the documentation ([#6](https://github.com/CloudNationHQ/terraform-azure-sub/issues/6)) ([676d5af](https://github.com/CloudNationHQ/terraform-azure-sub/commit/676d5afaa3e4e98dbdfb691e76ab31888d4c232a))

## 1.0.0 (2025-03-13)


### Features

* add initial resources ([#1](https://github.com/CloudNationHQ/terraform-azure-sub/issues/1)) ([a0e4bc2](https://github.com/CloudNationHQ/terraform-azure-sub/commit/a0e4bc21cc39ad6adaa074f02cc6c35c473a9a5f))
