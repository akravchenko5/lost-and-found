import algoliasearch from 'algoliasearch';
import { timeToWords } from './dateHelper';

const client = algoliasearch(window.algoliaCredentials.appId, window.algoliaCredentials.searchKey);
const index = client.initIndex('Item');



const searchAutocomplete = () => {
  const titleField = document.getElementById('item_title');
  const lostOrFound = document.querySelector('.new-item-form-lost') ? 'found' : 'lost';
  const list = document.querySelector('.search-dropdown-results');

if (titleField) {
    titleField.addEventListener('keyup', () => {
      index.search(titleField.value, {
        attributesToRetrieve: ['title', 'category', 'address', 'objectID', 'created_at'],
        hitsPerPage: 5,
        facetFilters: [[`state:${lostOrFound}`]]
      }).then(({ hits }) => {
        list.innerHTML = "";
        if (hits.length != 0 && titleField.value != "") {
          let listItems = ""
          hits.forEach((hit) => {
              listItems += `<li>
              <div id='dropdown-image'></div>
              <a class="title" href="/items/${hit.objectID}">${hit.title}</a>
              <p>${timeToWords(new Date, hit.created_at)}</p>
              </li>
          `});

          list.insertAdjacentHTML('beforeend',`
              <h5>Similar ${lostOrFound} ${hits.length > 1 ? 'items:' : 'item:'}</h5>
              ${listItems}
        `);
        }
      });
    });
    window.addEventListener('click', (event) => {
      if (event.target.closest('.search-dropdown-results')) return;
      list.innerHTML = "";
    })

  }
}

export { searchAutocomplete };
