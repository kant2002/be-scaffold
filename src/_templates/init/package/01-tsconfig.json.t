---
to:  <%= packageName %>/tsconfig.json
---

{
    "extends": "@kant2002-diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "outDir": "dist",
        "declaration": true,
        "declarationDir": "dist/types",
        "baseUrl": ".",
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        },
        "plugins": [{ "transform": "typescript-transform-paths" }, { "transform": "typescript-transform-paths", "afterDeclarations": true }]
    },
    "include": ["src/**/*"],
    "exclude": ["node_modules", "tests"]
}
