---
to:  <%= scheduledTaskPath %>
---

import { EventBusListener, ScheduledTaskEvent } from '@kant2002-diia-inhouse/diia-queue'

export default class <%= taskEnumKey %>Task implements EventBusListener {
    readonly event: ScheduledTaskEvent = ScheduledTaskEvent.<%= taskEnumKey %>

    async handler(): Promise<void> {}
}

