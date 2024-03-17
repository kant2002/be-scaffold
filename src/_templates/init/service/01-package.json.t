---
to:  <%= serviceName %>/package.json
---

{
    "name": "<%= serviceName %>",
    "version": "1.0.0",
    "description": "<%= description %>",
    "author": "diia-team",
    "main": "dist/index.js",
    "scripts": {
        "prepare": "ts-patch install -s",
        "build": "rimraf dist/ && mkdir dist && npm run genproto && tsc",
        "start": "node dist/index.js",
        "semantic-release": "semantic-release",
        "lint": "eslint --ext .ts . && prettier --check .",
        "lint-fix": "eslint --ext .ts --fix && prettier --write .",
        "lint:lockfile": "lockfile-lint --path package-lock.json --allowed-hosts registry.npmjs.org --validate-https",
        "test": "jest",
        "test:integration": "npm run test --selectProjects integration --",
        <%if (h.isOptionSelected(selectedOptions, 'database')) {%>
        "migrate-deploy": "npm run migrate up",
        "migrate-ci": "npm run migrate up",
        "migrate-test": "NODE_ENV=test npm run migrate up",
        "migrate": "sh -c 'ts-node --project migrations/tsconfig.json node_modules/.bin/migrate-mongo $0 $1 -f migrate-mongo-config.ts'",
        "indexes:sync": "MONGO_INDEXES_SYNC=true MONGO_INDEXES_EXIT_AFTER_SYNC=true npm run start",
        <%}%>
        "find-circulars": "madge --circular --extensions ts ./",
        "scaffold": "scaffold",
        "genproto": "genproto --outputDir src/generated"
    },
    "keywords": [],
    "engines": {
        "node": ">=18"
    },
    "_moduleAliases": {
        "@services": "dist/services",
        "@interfaces": "dist/interfaces",
        "@actions": "dist/actions",
        "@src": "dist",
        "@tests": "tests"
    },
    "jest": {
        "preset": "@kant2002-diia-inhouse/configs/dist/jest"
    },
    "commitlint": {
        "extends": "@kant2002-diia-inhouse/configs/dist/commitlint"
    },
    "eslintConfig": {
        "extends": "@kant2002-diia-inhouse/eslint-config",
        "parserOptions": {
            "project": [
                "./tsconfig.json",
                "./tests/tsconfig.json"
                <%if (h.isOptionSelected(selectedOptions, 'database')) {%>
                ,"./migrations/tsconfig.json"
                <%}%>
            ]
        }
    },
    "release": {
        "extends": "@kant2002-diia-inhouse/configs/dist/semantic-release/service"
    },
    "prettier": "@kant2002-diia-inhouse/eslint-config/prettier",
    "madge": {
        "tsConfig": "./tsconfig.json"
    }
}
