/* eslint-env mocha */
import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import Footer from '../components/Footer';

describe('<Footer />', () => {
  const footer = shallow(<Footer subtext="Woohoo it is working" />);
  const text = footer.find('p');

  it('should render title correctly', () => {
    expect(text.text()).to.equal('Woohoo it is working');
  });

  it('should have a p tag', () => {
    expect(text).to.have.length(1);
  });
});
