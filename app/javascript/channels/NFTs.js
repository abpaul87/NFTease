const list = document.querySelector('#results');

const insertNFTs = (data) => {
  data.Search.forEach((result) => {
    const nft = `<li>
      <img src="${result.Poster}" alt="" />
      <p>${result.Title}</p>
    </li>`;
    list.insertAdjacentHTML('beforeend', NFT);
  });
};

// const fetchNFTs = (query) => {
  //fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
    //.then(response => response.json())
    //.then(insertNFTs);
//};