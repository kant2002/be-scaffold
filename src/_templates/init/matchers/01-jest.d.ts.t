---
to: <%= jestTypesDeclarationPath %>
force: true
---

/// <reference types="@kant2002-diia-inhouse/configs/jest/types" />

declare namespace jest {
    interface Matchers<R> {
        <%= tsConfigPath %>(): any
    }

    interface Expect {
        <%= tsConfigPath %>(): any
    }
}
