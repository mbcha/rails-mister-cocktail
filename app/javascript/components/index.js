function showAll() {
  const allButton = document.querySelector('.all-btn');
  const topCards = document.querySelector('.top-cards');
  const allCards = document.querySelector('.all-cards');

  allButton.addEventListener('click', (event) => {
    if (allButton.innerHTML == "View All") {
      allButton.innerHTML = "Close";
    }
    else {
      allButton.innerHTML = "View All";
    }
    topCards.classList.toggle('hidden');
    allCards.classList.toggle('hidden');
  });
};

export { showAll };
