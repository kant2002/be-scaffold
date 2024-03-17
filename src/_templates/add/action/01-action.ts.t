---
to:  <%= actionPath %>
---

import { GrpcAppAction } from '@kant2002-diia-inhouse/diia-app'

import { ActionVersion, SessionType } from '@kant2002-diia-inhouse/types'
<% if (isActionWithValidation) { %>
  import { ValidationSchema } from '@kant2002-diia-inhouse/validators'
<% } %>

import { ActionResult, CustomActionArguments } from '<%= relativeInterfacePath %>'

export default class <%= h.changeCase.pascal(name) %>Action implements GrpcAppAction {
    constructor(private readonly service: unknown) {}

    readonly sessionType: SessionType = SessionType.<%= sessionType %>

    readonly actionVersion: ActionVersion = ActionVersion.V<%= version %>

    readonly name: string = '<%= name %>'

    <% if (isActionWithValidation) { %>
      readonly validationRules: ValidationSchema<CustomActionArguments['params']> = {}
    <% } %>
      
    async handler(args: CustomActionArguments): Promise<ActionResult> {
        const {
            params: {},
            <% if (sessionType === 'User') { %> session: { user }, <% } %>
        } = args
    }
}

