require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { createItem, foundNew, displaySettings } from '../components/init_create_item';
import { toggleSettings } from '../components/init_toggle_settings';
import { toggleForm } from '../components/init_sign_in';
import { review } from '../components/init_reviews';
import { count } from '../plugins/init_counter';
import { chatLoadListener, uploadButton } from '../components/init_messages';
import { initAutocomplete, addressAutocompleteFoundLost } from '../plugins/init_autocomplete';
import { initSlider } from '../plugins/init_slider';
import { fetchCurrentPosition } from '../components/init_current_location';
import { subscribeUser } from '../plugins/init_conversation';
// import { searchAutocomplete } from '../plugins/algolia';

initMapbox();
createItem();
foundNew();
count();
displaySettings();
toggleSettings();
toggleForm();
review();
initAutocomplete();
addressAutocompleteFoundLost();
initSlider();
subscribeUser();
uploadButton();

fetchCurrentPosition();
// searchAutocomplete();
chatLoadListener();



