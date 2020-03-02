import algoliasearch from 'algoliasearch';

const searchAutocomplete = () => {


const client = algoliasearch('1LWVV3TZRZ', '696ddfef9346874983dd1d2ec842b9bd');
const index = client.initIndex('items');
index.setSettings({
  searchableAttributes: ['title'],
  customRanking: ['desc(points)'],
});
// const teams = client.initIndex('teams');


autocomplete(
    '#aa-search-input',
    {
      debug: true,
      templates: {
        dropdownMenu:
          '<div class="aa-dataset-player"></div>' +
          '<div class="aa-dataset-team"></div>',
      },
    },
    [
      {
        source: autocomplete.sources.hits(items, {hitsPerPage: 7}),
        displayKey: 'title',
        name: 'item',
        templates: {
          header: '<div class="aa-suggestions-category">items</div>',
          suggestion({_highlightResult}) {
            return `<span>${_highlightResult.title.value}</span><span>${_highlightResult.address.value}</span>`;
          },
          empty: '<div class="aa-empty">No matching items</div>',
        },
      }
    ]
  );
};

export { searchAutocomplete }

