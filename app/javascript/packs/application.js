import 'bootstrap';
import { openNewIngredientForm } from '../components/show';
import { openNewReviewForm } from '../components/show';
import { showAll } from '../components/index';
if (document.querySelector('.all-btn')) {
  showAll();
}
openNewReviewForm();
openNewIngredientForm();
