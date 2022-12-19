import { ROUTER, PUBLIC_PROCEDURE } from '../../trpc';

export const healthRouter = ROUTER({
  health: PUBLIC_PROCEDURE.query(() => {
    return 'ok!! Time to get to work!';
  }),
});
