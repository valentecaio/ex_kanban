import '../styles/Card.css'
import React from 'react'
import { dateTimeToDate } from '../utils/date'
import TaskModal from './TaskModal'

const Card = ({ task }) => {
  const [showModal, setShowModal] = React.useState(false)

  return (
    <div className='Card' onClick={() => setShowModal(!showModal)}>
      <h2>{task.name}</h2>
      <p>{dateTimeToDate(task.executionDate)}</p>
      <p>{task.priority}</p>
      <TaskModal isOpen={showModal} task={task} />
    </div >
  );
}

export default Card;
