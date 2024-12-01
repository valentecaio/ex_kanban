import React from 'react'
import { useQuery, gql } from '@apollo/client'

const GET_TASKS = gql`
query {
  listTasks(search: "dESC") {
    id
    name
    description
    executionDate
    priority
  }
}`;

export default function Home() {
  const obj = useQuery(GET_TASKS);
  // const { loading, error, data } = useQuery(GET_TASKS)
  console.log(obj)
  return <div>...</div>;
}
