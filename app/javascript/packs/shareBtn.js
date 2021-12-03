import copy from 'copy-to-clipboard';
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';

export const copyingText = () =>{
  const copyBtn = document.querySelector("#shareButtonShow")

  if (!copyBtn) {
    return;
  }

  copyBtn.addEventListener('click', (event) =>{
    console.log(copyBtn.dataset.url);

    // Copy with options
    copy(copyBtn.dataset.url , {
      debug: true,
      message: 'Copied'
    });

    const tip = tippy(copyBtn, { content: 'Copied!' });
    tip.show();
  });
  }
