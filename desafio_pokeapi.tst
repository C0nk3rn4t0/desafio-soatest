---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 03
suite:
  $type: TestSuite
  name: Test Suite
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - variables:
      - name: BASE_URL
        value: https://pokeapi.co/api/v2
      name: Local
      active: true
  lastModifiedBy: ed_de
  tests:
  - $type: TestSuite
    name: Escenario1
    testID: 1
