import counterUp from 'counterup2'


const count = () => {
  const el = document.querySelectorAll( '.counter' )
  if (el) {

    el.forEach(item => {
      window.addEventListener('load', (event) => {
      console.log('count');

      counterUp( item, {
        duration: 800,
        delay: 16,
      } )

    });

    });

  }
}

export { count }


