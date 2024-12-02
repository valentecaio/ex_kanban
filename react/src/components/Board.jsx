import '../styles/Board.css'
import Column from '../components/Column'
import { useQuery } from '@apollo/client'
import { BeatLoader } from 'react-spinners'
import * as queries from '../graphql/queries'

const Board = ({ filters }) => {
  const q = queries.get_tasks()
  const { loading, error, data } = useQuery(q, { variables: filters });
  if (loading)
    return <BeatLoader />
  if (error) {
    console.log(error)
    return <p>Something went wrong. Check the console.</p>
  }

  return (
    <div className="Board">
      <Column tasks={data.listTasks.filter((t) => t.status === "backlog")} title="Backlog" />
      <Column tasks={data.listTasks.filter((t) => t.status === "in_progress")} title="In Progress" />
      <Column tasks={data.listTasks.filter((t) => t.status === "done")} title="Done" />
    </div>
  );
}

export default Board;
