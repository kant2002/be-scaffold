---
to:  <%= serviceName %>/src/interfaces/deps.ts
---

import { GrpcService } from '@kant2002-diia-inhouse/diia-app'

<%- h.isOptionSelected(selectedOptions, 'database') ? "import { DatabaseService } from '@kant2002-diia-inhouse/db'" : '' %>
<%- h.isOptionSelected(selectedOptions, 'redis') ? "import { RedisDeps } from '@kant2002-diia-inhouse/redis'" : '' %>
<%- h.isOptionSelected(selectedOptions, 'http') ? "import { HttpDeps } from '@kant2002-diia-inhouse/http'" : '' %>
<%- h.isOptionSelected(selectedOptions, ['internal', 'external']) ? "import { QueueDeps } from '@kant2002-diia-inhouse/diia-queue'" : '' %>

import { AnalyticsService } from '@kant2002-diia-inhouse/analytics'
import { HealthCheck } from '@kant2002-diia-inhouse/healthcheck'

import { AppConfig } from '@src/interfaces/config'

export type AppDeps = {
    config: AppConfig
    healthCheck: HealthCheck
    grpcService: GrpcService
    analytics: AnalyticsService
    <%- h.isOptionSelected(selectedOptions, 'database') ? "database: DatabaseService" : '' %>
} <%- h.isOptionSelected(selectedOptions, ['internal', 'external']) ? "& Partial<QueueDeps>" : '' %>
<%- h.isOptionSelected(selectedOptions, 'redis') ? "& Partial<RedisDeps>" : '' %>
<%- h.isOptionSelected(selectedOptions, 'http') ? "& HttpDeps" : '' %>
