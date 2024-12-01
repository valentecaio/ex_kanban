import '../styles/Home.css'
import React from 'react'
import Header from '../components/Header'
import Board from '../components/Board'

const Home = () => {
  const [filters, setFilters] = React.useState(new Map())

  const setFiltersAndLog = (search, date, location, priority) => {
    var f = {
      search: search !== "" ? search : null,
      date: date !== "" ? date : null,
      location: location !== "" ? location : null,
      priority: priority !== "" ? priority : null
    }
    setFilters(f)
    console.log("New filters: ", f)
  }

  return (
    <div className="Home">
      <Header setFilters={setFiltersAndLog} />
      <Board filters={filters} />
    </div>
  );
}

export default Home;
