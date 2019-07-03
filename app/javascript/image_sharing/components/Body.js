import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';
import FeedbackForm from './FeedbackForm';

@observer
class Body extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  render() {
    return (
      <Row>
        <Col lg={{ size: 4, offset: 4 }}>
          <FeedbackForm store={this.props.store} onClick={this.onClickHandler} />
        </Col>
      </Row>
    );
  }
}

export default Body;
