function parseDate(dateStr) {
  // Assuming dateStr is in "DD/MM/YYYY" format
  const parts = dateStr.split("/");
  const day = parseInt(parts[0], 10);
  const month = parseInt(parts[1], 10) - 1; // Month is 0-indexed in JavaScript Date
  const year = parseInt(parts[2], 10);

  // Create a new Date object with Date.UTC to set it to UTC midnight
  const date = new Date(Date.UTC(year, month, day));
  return date;
}

// Format the date to local timezone but as received without time adjustments
function formatDate(date) {
  return new Date(date).toLocaleDateString('en-GB', { timeZone: 'UTC' });
}

function dateToDateTime(date) {
  if (date == null || date === "") {
    return null;
  }

  // Parse the date
  const parts = date.toString().split("-");
  const year = parseInt(parts[0]);
  const month = parseInt(parts[1]) - 1; // Month is 0-indexed in JavaScript Date
  const day = parseInt(parts[2]);

  // Return as ISO 8601 string format
  return new Date(Date.UTC(year, month, day)).toISOString();  // Converts to format like "2022-01-01T00:00:00.000Z"
}

export { formatDate, dateToDateTime };
