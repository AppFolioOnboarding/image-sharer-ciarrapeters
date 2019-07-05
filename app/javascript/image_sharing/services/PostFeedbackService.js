import { post } from '../utils/helper';

export class PostFeedbackService {
  constructor(store, params) {
    this.store = store;
    this.params = params;
  }

  postFeedback = () => post('/api/feedbacks', this.params).then(() => {
    this.reset();
  }).catch(() => {
  });
}

export default PostFeedbackService;
