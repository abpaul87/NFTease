import Sortable from 'sortablejs';

const initSortable = () => {
  console.log('hi');
  const list = document.querySelector('.itemchosens');
  if (list) {
    Sortable.create(list);
  }
};

export { initSortable };

// import { fetchNFTs, updateResultsList } from './nfts';
// import { initSortable } from './plugins/init_sortable'; // <-- add this

// fetchNFTs('');
// initSortable(); // <-- add this

// const form = document.querySelector('#search-form');
// form.addEventListener('edit', updateResultsList);
