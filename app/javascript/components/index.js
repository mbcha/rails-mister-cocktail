function showAll() {
  const allButton = document.querySelector('.all-btn');
  const topCards = document.querySelector('.top-cards');
  const allCards = document.querySelector('.all-cards');

  allButton.addEventListener('click', (event) => {
    topCards.classList.add('hidden');
    allCards.classList.remove('hidden');
  });
};

export { showAll };
