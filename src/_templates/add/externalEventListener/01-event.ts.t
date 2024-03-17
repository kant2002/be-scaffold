---
to: <%= eventPath %>
---

import { EventBusListener, ExternalEvent } from '@kant2002-diia-inhouse/diia-queue'
import { ValidationSchema } from '@kant2002-diia-inhouse/validators'

import { ExternalEventPayload } from '@interfaces/externalEventListeners/<%= h.changeCase.camel(eventEnumKey) %>'

export default class <%= eventEnumKey %>EventListener implements EventBusListener {
    readonly event: ExternalEvent = ExternalEvent.<%= eventEnumKey %>

    readonly isSync: boolean = true

    readonly validationRules: ValidationSchema<ExternalEventPayload> = {}
}
