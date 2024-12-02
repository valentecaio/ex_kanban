import '../styles/Header.css';
import React from 'react';

const Header = ({ setFilters }) => {
  const [search, setSearch] = React.useState('')
  const [date, setDate] = React.useState('')
  const [location, setLocation] = React.useState('')
  const [priority, setPriority] = React.useState('')

  const resetFilters = () => {
    setSearch('')
    setDate('')
    setLocation('')
    setPriority('')
    setFilters('', '', '', '')
  }

  return (
    <div className="Header">
      <div className="FilterKeyword">
        <div>Keyword</div>
        <input value={search} placeholder={"Filter by keyword..."} onChange={(e) => setSearch(e.target.value)} />
      </div>
      <div className="FilterExecutionDate">
        <div>Date</div>
        <input value={date} type="date" placeholder={"Filter by date..."} onChange={(e) => setDate(e.target.value)} />
      </div>
      <div className="FilterLocation">
        <div>Location</div>
        <input value={location} placeholder={"Filter by location..."} onChange={(e) => setLocation(e.target.value)} />
      </div>
      <div className="FilterPriority">
        <div>Priority</div>
        <input value={priority} placeholder={"Filter by priority..."} onChange={(e) => setPriority(e.target.value)} />
      </div>
      <button onClick={() => setFilters(search, date, location, priority)}>Apply filters</button>
      <button onClick={() => resetFilters()}>Reset filters</button>
    </div>
  );
};

export default Header;
