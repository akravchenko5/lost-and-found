import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js/es'
import { searchBox, hits } from 'instantsearch.js/es/widgets';
import { connectAutocomplete } from 'instantsearch.js/es/connectors';


const searchAutocomplete = () => {

const search = instantsearch({
  indexName: 'Item',
  searchClient: algoliasearch(
    '1LWVV3TZRZ',
    '344b5af8f379dac1979f13b494b4578a'
  ),
});

search.start();

// Helper for the render function


  const renderIndexListItem = ({ hits }) => `

      ${hits
        // .slice(0, 5)
        .map(
          hit =>
            `<li><a class="autocomplete-item" href="/items/${hit.objectID}">${instantsearch.highlight({ attribute: 'title', hit })}</a></li>`
        ).join('')}
    `;

  // Create the render function

  const renderAutocomplete = (renderOptions, isFirstRender) => {
    const { indices, currentRefinement, refine, widgetParams } = renderOptions;

    if (isFirstRender) {
      const input = document.createElement('input', 'search');
      const ul = document.createElement('div');

      input.addEventListener('input', event => {
        refine(event.currentTarget.value);
      });

      widgetParams.container.appendChild(input);
      widgetParams.container.appendChild(ul);
    }

    widgetParams.container.querySelector('input').value = currentRefinement;
    widgetParams.container.querySelector('div').innerHTML = indices
      .map(renderIndexListItem)
      .join('');
  };

  const customAutocomplete = connectAutocomplete(
    renderAutocomplete
  );

  search.addWidget(
    customAutocomplete({
      container: document.querySelector('#autocomplete')
    })
  );
}

export { searchAutocomplete }

