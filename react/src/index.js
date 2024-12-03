import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import { ApolloClient, ApolloProvider, InMemoryCache, createHttpLink } from '@apollo/client';

// Apollo Client setup
const uri = 'http://localhost:4000/api/graphql';
const client = new ApolloClient({
  link: createHttpLink({ uri: uri }),
  cache: new InMemoryCache(),
});

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>
  </React.StrictMode>
);
