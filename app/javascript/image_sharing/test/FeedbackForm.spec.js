/* eslint-env mocha */

import 'jsdom-global/register';
import React from 'react';
import { expect } from 'chai';
import { shallow, configure } from 'enzyme';
import { Form, Button } from 'reactstrap';
import sinon from 'sinon';
import Adapter from 'enzyme-adapter-react-16';
import FeedbackForm from '../components/FeedbackForm';

configure({ adapter: new Adapter() });

describe('<FeedbackForm />', () => {
  it('should render correctly', () => {
    const store = {
      userName: 'Jeremy',
      comments: 'is the best'
    };
    const onClick = sinon.spy();
    const feedbackForm = shallow(<FeedbackForm store={store} onClick={onClick} />);
    const form = feedbackForm.find(Form);

    expect(form).to.have.length(1);

    const usernameInput = form.find('.username-input');
    expect(usernameInput).to.have.length(1);
    expect(usernameInput.props().value).to.equal('Jeremy');
    const comments = form.find('.comment-input');
    expect(comments).to.have.length(1);
    expect(comments.prop('value')).to.equal('is the best');

    const button = form.find(Button);
    expect(button).to.have.length(1);
  });
});
