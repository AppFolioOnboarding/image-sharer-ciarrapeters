import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';

class Footer extends Component {
  static propTypes = {
    subtext: PropTypes.string.isRequired
  };

  render() {
    const subtext = this.props.subtext;
    return (
      <div>
        <Row>
          <Col>
            <p className='text-center' style={{fontSize: '10px'}}>
              {subtext}
            </p>
          </Col>
        </Row>
      </div>
    );
  }
}

export default Footer;
