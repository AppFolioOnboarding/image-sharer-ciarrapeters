/* eslint-env mocha */
import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import Body from '../components/Body';
import FeedbackForm from '../components/FeedbackForm';


describe('<Body />', () => {
  it('should render correctly', () => {
    const store = {};
    const wrapper = shallow(<Body store={store} />);
    const text = wrapper.find(FeedbackForm);

    expect(text).to.have.length(1);
  });
});
