export const heart = () => {

  const hearts = document.querySelectorAll('.like-button2')
  // console.log(hearts)

  hearts.forEach((heart)=> {
    heart.addEventListener('click', (e) => {
      e.currentTarget.classList.toggle('liked');
      console.log(e.currentTarget.classList);
      })
  });
}
