import React, {PropTypes} from 'react'
import classnames from 'classnames'

import './incoming-list-status.scss'

export default function IncomingListStatus (props) {
  const { numItems } = props
  let level = 'good'
  if (numItems > 10) {
    level = 'warning'
  }
  if (numItems > 25) {
    level = 'danger'
  }

  return <div className={classnames('incoming-list-status', level)}>
    {numItems} items
  </div>
}

IncomingListStatus.propTypes = {
  numItems: PropTypes.number,
}
