---
to:  <%= serviceName %>/src/interfaces/actions/v1/getAddResult.ts
---

import { UserActionArguments } from '@kant2002-diia-inhouse/types'

import { GetAddResultRequest, GetAddResultResponse } from '@src/generated'

export interface CustomActionArguments extends UserActionArguments {
    params: GetAddResultRequest
}

export type ActionResult = GetAddResultResponse
