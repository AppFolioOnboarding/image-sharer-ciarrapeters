/* eslint-env mocha */

import 'jsdom-global/register';
import { expect } from 'chai';
import { FeedbackStore } from '../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('should set the username', () => {
    const store = new FeedbackStore();
    store.setUserName('name');
    expect(store.userName).to.equal('name');
  });

  it('should set the comments correctly', () => {
    const store = new FeedbackStore();
    store.setComments('this is great!');
    expect(store.comments).to.equal('this is great!');
  });
});
