/* eslint-env mocha */
import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import Header from '../components/Header';
import Footer from '../components/Footer';
import Body from '../components/Body';
import App from '../components/App';

describe('<App />', () => {
  it('should render correctly', () => {
    const stores = {
      feedbackStore: {}
    };
    const wrapper = shallow(<App.wrappedComponent stores={stores} />);
    const header = wrapper.find(Header);
    const body = wrapper.find(Body);
    const footer = wrapper.find(Footer);

    expect(header).to.have.length(1);
    expect(body).to.have.length(1);
    expect(footer).to.have.length(1);
  });
});
