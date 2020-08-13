import React, {useEffect, useState} from "react";
import axios from 'axios';

const MainContainer = (props) => {
    const [books, setBooks] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:3001/v1/books').then((results) => {
            console.log(results);
            setBooks(results.data)
        }).catch((data) => {
            console.log(data)
        })
    }, []);

    return (
        <div className="app-main">

        </div>
    )
};

export default MainContainer;
