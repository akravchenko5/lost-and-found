import algoliasearch from 'algoliasearch';

const client = algoliasearch('1LWVV3TZRZ', '344b5af8f379dac1979f13b494b4578a');
const index = client.initIndex('Item');



const searchAutocomplete = () => {
  const titleField = document.getElementById('item_title');
  const lostOrFound = document.querySelector('.new-item-form-lost') ? 'found' : 'lost';
  const list = document.querySelector('.search-dropdown-results');
  console.log(list);

if (titleField) {
    titleField.addEventListener('keyup', () => {
      index.search([titleField.value, lostOrFound], {
        attributesToRetrieve: ['title', 'category', 'address', 'objectID', 'created_at'],
        hitsPerPage: 5,
      }).then(({ hits }) => {
        list.innerHTML = "";
        if (hits.length != 0 && titleField.value != "") {
          let listItems = ""
          hits.forEach((hit) => {
              listItems += `<li>
              <div>
              <a class="title" href="/items/${hit.objectID}">${hit.title}</a>
              </div>
              <p>${dateHelper(new Date, hit.created_at)}</p>
              </li>
          `});

          list.insertAdjacentHTML('beforeend',`
            <h5>Similar ${lostOrFound} ${hits.length > 1 ? 'items:' : 'item:'}</h5>
            ${listItems}
        `);
        }
      });
    });
    window.addEventListener('click', () => {
      list.innerHTML = "";
    })

  }

  const dateHelper = (to, from) => {
    var from_date = new Date;
    from_date.setTime(Date.parse(from));

    var distance_in_seconds = ((to - from_date) / 1000);
    var distance_in_minutes = Math.floor(distance_in_seconds / 60);
    var tense = distance_in_seconds < 0 ? " from now" : " ago";
    distance_in_minutes = Math.abs(distance_in_minutes);
    if (distance_in_minutes == 0) { return 'less than a minute'+tense; }
    if (distance_in_minutes == 1) { return '1 minute'+tense; }
    if (distance_in_minutes < 45) { return distance_in_minutes + ' minutes'+tense; }
    if (distance_in_minutes < 90) { return '1 hour'+tense; }
    if (distance_in_minutes < 1440) { return Math.floor(distance_in_minutes / 60) + ' hours'+tense; }
    if (distance_in_minutes < 2880) { return '1 day'+tense; }
    if (distance_in_minutes < 43200) { return Math.floor(distance_in_minutes / 1440) + ' days'+tense; }
    if (distance_in_minutes < 86400) { return '1 month'+tense; }
    if (distance_in_minutes < 525960) { return Math.floor(distance_in_minutes / 43200) + ' months'+tense; }
    if (distance_in_minutes < 1051199) { return '1 year'+tense; }
    return 'over ' + Math.floor(distance_in_minutes / 525960) + ' years';
  }
}



// const searchAutocomplete = () => {
//   const titleField = document.getElementById('q');
//   const lostOrFound = document.querySelector('.new-item-form-lost') ? 'found' : 'lost';
//   const list = document.getElementById('search-results');


//   titleField.addEventListener('keyup', () => {
//     index.search([titleField.value, lostOrFound], {
//       attributesToRetrieve: ['title', 'category', 'description', 'address', 'objectID'],
//       hitsPerPage: 5,
//     }).then(({ hits }) => {
//       console.log(hits);
//       list.innerHTML = "";
//       if (hits.length != 0 ) {

//       hits.forEach((hit) => {
//         list.insertAdjacentHTML('beforeend', `<li><a href="/items/${hit.objectID}">${hit.title}</a></li>`);
//       });
//       }
//     });
//   });


//   window.addEventListener('click', () => {
//     list.innerHTML = "";
//   })
// }

export { searchAutocomplete };
