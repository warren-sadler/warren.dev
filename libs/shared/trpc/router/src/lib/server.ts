import { healthRouter } from './routes/health';
import { ROUTER } from './trpc';

export const appRouter = ROUTER({
  health: healthRouter,
});

export type AppRouter = typeof appRouter;
