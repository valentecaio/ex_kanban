import '../styles/Home.css'
import React from 'react'
import Header from '../components/Header'
import Board from '../components/Board'
import { dateToDateTime } from '../utils/date'

const Home = () => {
  const [filters, setFilters] = React.useState(new Map())

  // prepare filters to be sent to the graphql query
  const setQueryFilters = (search, date, location, priority) => {
    setFilters({
      search: search !== "" ? search : null,
      executionDate: date !== "" ? dateToDateTime(date) : null,
      location: location !== "" ? location : null,
      priority: priority !== "" ? priority.toLowerCase() : null,
    })
  }

  return (
    <div className="Home">
      <Header setFilters={setQueryFilters} />
      <Board filters={filters} />
    </div>
  );
}

export default Home;
