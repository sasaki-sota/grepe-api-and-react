import React from "react";

const ViewBook = (props) => {
    return (
        <div>
            <span>{props.data.title}</span>
            <span>{props.data.price}</span>
        </div>
    )
};

export default ViewBook;
