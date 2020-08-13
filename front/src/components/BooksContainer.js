import React from "react";
import ViewBook from './ViewBook';

const BooksContainer = (props) => {
    return (
        <div className='booklist'>
            {props.bookData.map((data) => {
                return (
                    <ViewBook data={data} key={data.id}/>
                )
            })}
        </div>
    )
};

export default BooksContainer;
