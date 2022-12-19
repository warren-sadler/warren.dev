import * as trpcExpress from '@trpc/server/adapters/express';
import { INestApplication } from '@nestjs/common';
import { appRouter, createContext } from '@warren.dev/shared/trpc/router';

export function mountTRPC(app: INestApplication) {
  const api = app.getHttpAdapter();
  api.use(
    '/trpc',
    trpcExpress.createExpressMiddleware({
      router: appRouter,
      createContext,
    })
  );
}
