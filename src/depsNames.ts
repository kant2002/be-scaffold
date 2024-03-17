const devDeps = [
    '@kant2002-diia-inhouse/configs',
    '@kant2002-diia-inhouse/eslint-config',
    '@kant2002-diia-inhouse/test',
    '@kant2002-diia-inhouse/genproto',
    '@kant2002-diia-inhouse/test',
    '@types/jest',
    'eslint',
    'jest',
    'lockfile-lint',
    'madge',
    'prettier',
    'rimraf',
    'semantic-release',
    'ts-node',
    'ts-patch',
    'typescript',
]

export const packageDependencies = { devDeps }

export const serviceDependencies = {
    devDeps: [...devDeps, '@kant2002-diia-inhouse/scaffold'],
    deps: [
        '@kant2002-diia-inhouse/analytics',
        '@kant2002-diia-inhouse/crypto',
        '@kant2002-diia-inhouse/db',
        '@kant2002-diia-inhouse/diia-app',
        '@kant2002-diia-inhouse/diia-logger',
        '@kant2002-diia-inhouse/diia-queue',
        '@kant2002-diia-inhouse/diia-metrics',
        '@kant2002-diia-inhouse/env',
        '@kant2002-diia-inhouse/errors',
        '@kant2002-diia-inhouse/healthcheck',
        '@kant2002-diia-inhouse/http',
        '@kant2002-diia-inhouse/redis',
        '@kant2002-diia-inhouse/types',
        '@kant2002-diia-inhouse/utils',
        '@kant2002-diia-inhouse/validators',
        'migrate-mongo',
        'module-alias',
    ],
}
