import { initTRPC } from '@trpc/server';
import { Context } from './context';

const t = initTRPC.context<Context>().create({});

export const ROUTER = t.router;
export const MIDDLWARE = t.middleware;
export const PUBLIC_PROCEDURE = t.procedure;
