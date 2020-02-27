require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { createItem, foundNew, displaySettings } from '../components/init_create_item';
import { toggleSettings } from '../components/init_toggle_settings';
import { toggleForm } from '../components/init_sign_in';
import { count } from '../plugins/init_counter';

initMapbox();
createItem();
foundNew();
count();
displaySettings();
toggleSettings();
toggleForm();
