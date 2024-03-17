---
to:  <%= serviceName %>/src/deps.ts
---
import { asClass, asValue } from "awilix";

import { DepsFactoryFn, GrpcService <%= h.isOptionSelected(selectedOptions, 'http') ? ", DepsResolver" : '' %> } from "@kant2002-diia-inhouse/diia-app";

import { AnalyticsService } from '@kant2002-diia-inhouse/analytics'

<%if (h.isOptionSelected(selectedOptions, 'database')) {%>
  import { DatabaseService, DbType } from "@kant2002-diia-inhouse/db";
<%}%>

import DiiaLogger from "@kant2002-diia-inhouse/diia-logger";
import { HealthCheck } from "@kant2002-diia-inhouse/healthcheck";

<%if (h.isOptionSelected(selectedOptions, 'http')) {%>
  import { HttpDeps, HttpService } from "@kant2002-diia-inhouse/http";
  import { HttpProtocol } from "@kant2002-diia-inhouse/types";
<%}%>

import { AppDeps } from "@interfaces/deps";
import { AppConfig } from "@interfaces/config";

export default (
  config: AppConfig
): ReturnType<DepsFactoryFn<AppConfig, AppDeps>> => {
  const { 
    healthCheck,
    <%= h.isOptionSelected(selectedOptions, 'database') ? "db" : '' %>
  } = config;

  <%if (h.isOptionSelected(selectedOptions, 'http')) {%>
    const httpDeps: DepsResolver<HttpDeps> = {
      httpService: asClass(HttpService, { injector: () => ({ protocol: HttpProtocol.Http }) }).singleton(),
      httpsService: asClass(HttpService, { injector: () => ({ protocol: HttpProtocol.Https }) }).singleton(),
    }
  <%}%>

  return {
    config: asValue(config),
    logger: asClass(DiiaLogger, {
      injector: () => ({ options: { logLevel: process.env.LOG_LEVEL } }),
    }).singleton(),
    healthCheck: asClass(HealthCheck, {
      injector: (c) => ({
        container: c.cradle,
        healthCheckConfig: healthCheck,
      }),
    }).singleton(),
    grpcService: asClass(GrpcService, { injector: (c) => ({ container: c }) }).singleton(),
    analytics: asClass(AnalyticsService).singleton(),

    <%if (h.isOptionSelected(selectedOptions, 'database')) {%>
      database: asClass(DatabaseService, { injector: () => ({ dbConfigs: { [DbType.Main]: db } }) }).singleton(),
    <%}%>

    <%= h.isOptionSelected(selectedOptions, 'http') ? "...httpDeps," : '' %>
  };
};
