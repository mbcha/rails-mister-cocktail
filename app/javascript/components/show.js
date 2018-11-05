function openNewIngredientForm() {
  const ingredientButton = document.querySelector('.btn-ingredient');
  const ingredientForm = document.querySelector('.ingredient-form');
  ingredientButton.addEventListener('click', (event) => {
    ingredientButton.classList.add('hidden');
    ingredientForm.classList.remove('hidden');
  });
};

export { openNewIngredientForm };

function openNewReviewForm() {
  const reviewButton = document.querySelector('.btn-review');
  const reviewForm = document.querySelector('.review-form');
  reviewButton.addEventListener('click', (event) => {
    reviewButton.classList.add('hidden');
    reviewForm.classList.remove('hidden');
  });
};

export { openNewReviewForm };



