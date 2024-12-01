import '../styles/Board.css'
import Column from '../components/Column'
import { useQuery } from '@apollo/client'
import { BeatLoader } from 'react-spinners'
import * as queries from '../graphql/queries'


const Board = ({ filters }) => {
  const q = queries.get_tasks_with_filters()
  const { loading, error, data } = useQuery(q, {
    variables: {
      search: filters.search,
      executionDate: filters.date,
      address: filters.location,
      priority: filters.priority
    }
  });
  // const { loading, error, data } = useQuery(queries.get_tasks());
  if (loading)
    return <BeatLoader />
  if (error) {
    console.log(error)
    return <p>Something went wrong. Check the console.</p>
  }

  console.log(data.listTasks)

  return (
    <div className="Board">
      <Column tasks={data.listTasks} title="Backlog" />
      <Column tasks={data.listTasks} title="Doing" />
      <Column tasks={data.listTasks} title="Done" />
    </div>
  );
}

export default Board;
