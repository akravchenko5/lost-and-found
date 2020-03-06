const timeToWords = (to, from) => {
  const from_date = new Date;
  from_date.setTime(Date.parse(from));

  const distance_in_seconds = ((to - from_date) / 1000);
  let distance_in_minutes = Math.floor(distance_in_seconds / 60);
  const tense = distance_in_seconds < 0 ? " from now" : " ago";

  distance_in_minutes = Math.abs(distance_in_minutes);

  if (distance_in_minutes == 0) { return 'less a min'+tense; }
  if (distance_in_minutes == 1) { return '1/min'+tense; }
  if (distance_in_minutes < 45) { return distance_in_minutes + '/mins'+tense; }
  if (distance_in_minutes < 90) { return '1 hr'+tense; }
  if (distance_in_minutes < 1440) { return Math.floor(distance_in_minutes / 60) + '/hrs'+tense; }
  if (distance_in_minutes < 2880) { return '1 day'+tense; }
  if (distance_in_minutes < 43200) { return Math.floor(distance_in_minutes / 1440) + ' days'+tense; }
  if (distance_in_minutes < 86400) { return '1 month'+tense; }
  if (distance_in_minutes < 525960) { return Math.floor(distance_in_minutes / 43200) + ' months'+tense; }
  if (distance_in_minutes < 1051199) { return '1 year'+tense; }

  return 'over ' + Math.floor(distance_in_minutes / 525960) + ' years';
}


export { timeToWords };
