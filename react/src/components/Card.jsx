import '../styles/Card.css'
import React from 'react'
import { dateTimeToDate } from '../utils/date'
import ReactModal from 'react-modal'
ReactModal.setAppElement('*'); // suppresses modal-related test warnings.

const Card = ({ task }) => {
  const date = dateTimeToDate(task.executionDate)
  const [showModal, setShowModal] = React.useState(false)

  const cardClicked = (id) => {
    console.log(`Card ${id} clicked`);
    setShowModal(!showModal)
  }

  return (
    <div className='Card' onClick={() => cardClicked(task.id)}>
      <ReactModal isOpen={showModal}>
        <h2>{task.name}</h2>
        <p>{`Description: ${task.description}`}</p>
        <p>{`When: ${date}`}</p>
        <p>{`Priority: ${task.priority}`}</p>
        <p>{`Attachments:`}</p>
        {task.attachments.map(a => (
          <div key={a.id}>
            {/* <a href={a.url}>{`${a.url}\n`}</a> */}
            <img src={a.url} alt={a.url} width="300px" />
          </div>
        ))}
      </ReactModal>
      <h2>{task.name}</h2>
      <p>{date}</p>
      <p>{task.priority}</p>
    </div >
  );
}

export default Card;
