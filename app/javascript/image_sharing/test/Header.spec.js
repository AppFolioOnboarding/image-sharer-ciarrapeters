/* eslint-env mocha */
import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import Header from '../components/Header';

describe('<Header />', () => {
  const header = shallow(<Header title="Welcome to my humble app" />);
  const title = header.find('h3');

  it('should have an h3', () => {
    expect(title).to.have.lengthOf(1);
  });

  it('properly renders the title text', () => {
    expect(title.text()).to.equal('Welcome to my humble app');
  });
});
