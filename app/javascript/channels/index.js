// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

import { fetchNFTs, updateResultsList } from './nfts';
import { initSortable } from './plugins/init_sortable'; // <-- add this

fetchNFTs('');
initSortable(); // <-- add this

const form = document.querySelector('#search-form');
form.addEventListener('edit', updateResultsList);