import { trpc } from '@warren.dev/shared/trpc/client';

export function App() {
  const query = trpc.health.health.useQuery();
  return (
    <div>
      <header>
        <h1>Welcome client!</h1>
        <p>{query.data}</p>
      </header>
    </div>
  );
}

export default App;
