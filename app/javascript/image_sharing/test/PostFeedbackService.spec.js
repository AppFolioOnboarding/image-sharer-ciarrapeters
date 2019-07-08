/* eslint-env mocha */
import 'jsdom-global/register';
import sinon from 'sinon';
import { PostFeedbackService } from '../services/PostFeedbackService';
import * as api from '../utils/helper';

describe('PostFeedbackService', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('posts data on a resolved promise', () => {
    const store = {
      setResponse: sinon.spy(),
      reset: sinon.spy()
    };

    const data = Promise.resolve({ message: 'hello' });
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(store, {});
    return service.postFeedback().then(() => {
      sinon.assert.calledOnce(store.reset);
    });
  });

  it('does not post data on a failed promise', () => {
    const store = {
      setRespone: sinon.spy(),
      reset: sinon.spy()
    };

    const data = Promise.reject(new Error('fail'));
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(store, {});
    return service.postFeedback().then(() => {
      sinon.assert.notCalled(store.reset);
    });
  });
});
