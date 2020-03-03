import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js/es'
import { searchBox, hits } from 'instantsearch.js/es/widgets';
import { connectAutocomplete } from 'instantsearch.js/es/connectors';


const searchAutocomplete = () => {

const searchClient = algoliasearch('1LWVV3TZRZ', '344b5af8f379dac1979f13b494b4578a');

const search = instantsearch({
  indexName: 'items',
  searchClient,
});

search.addWidgets([
  instantsearch.widgets.searchBox({
    container: '#autocomplete',
  }),

  instantsearch.widgets.hits({
    container: '#hits',
  })
]);

search.start();



// const search = instantsearch({
//   indexName: 'items',
//   searchClient: algoliasearch(
//   '1LWVV3TZRZ',
//   '344b5af8f379dac1979f13b494b4578a'
//   ),
// });

// search.start();

// // Helper for the render function
//   const renderIndexListItem = ({ indexId, hits }) => `
//     <li>
//       Index: ${indexId}
//       <ol>
//         ${hits
//           .map(
//             hit =>
//               `<li>${instantsearch.highlight({ attribute: 'title', hit })}</li>`
//           )
//           .join('')}
//       </ol>
//     </li>
//   `;

//   // Create the render function
//   const renderAutocomplete = (renderOptions, isFirstRender) => {
//     const { indices, currentRefinement, refine, widgetParams } = renderOptions;

//     if (isFirstRender) {
//       const input = document.createElement('input');
//       const ul = document.createElement('ul');

//       input.addEventListener('input', event => {
//         refine(event.currentTarget.value);
//       });

//       widgetParams.container.appendChild(input);
//       widgetParams.container.appendChild(ul);
//     }

//     widgetParams.container.querySelector('input').value = currentRefinement;
//     widgetParams.container.querySelector('ul').innerHTML = indices
//       .map(renderIndexListItem)
//       .join('');
//   };

//   // Create the custom widget
//   // const customAutocomplete = instantsearch.connectors.connectAutocomplete(
//   //   renderAutocomplete
//   // );
//   const customAutocomplete = connectAutocomplete(
//     renderAutocomplete
//   );

//   // const autocomplete = connectAutocomplete(renderer);
//   // Instantiate the custom widget
//   search.addWidgets([
//     index({ indexName: 'instant_search_title_asc' }),
//     // index({ indexName: 'instant_search_price_desc' }),

//     customAutocomplete({
//       container: document.querySelector('#autocomplete'),
//     })
//   ]);

}

export { searchAutocomplete }

