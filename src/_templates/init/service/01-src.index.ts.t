---
to:  <%= serviceName %>/src/index.ts
---

import { initTracing } from '@kant2002-diia-inhouse/diia-app'

import { ServiceName } from '@kant2002-diia-inhouse/types'

const serviceName = ServiceName.<%= h.changeCase.pascalCase(serviceName) %>

initTracing(serviceName)

import 'module-alias/register'
import { bootstrap } from './bootstrap'

bootstrap(serviceName)
