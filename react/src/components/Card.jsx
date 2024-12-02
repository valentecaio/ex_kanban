import '../styles/Card.css'
import React from 'react'
import { formatDate } from '../utils/date'

const Card = ({ task }) => {
  const date = formatDate(task.executionDate)
  // const date = new Date(task.executionDate).toLocaleDateString('en-UK');
  return (
    < div className='Card' >
      <h2>{task.name}</h2>
      <p>{date}</p>
      <p>{task.priority}</p>
    </div >
  );
}

export default Card;
