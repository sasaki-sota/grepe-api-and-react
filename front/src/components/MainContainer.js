import React, {useEffect, useState} from "react";
import axios from 'axios';
import BooksContainer from "./BooksContainer";
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/css/bootstrap-theme.css';
import FormContainer from "./FormContainer";
import update from 'react-addons-update'

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

    // const createBook = useEffect(() => {
    //     axios.post('http://localhost:3001/v1/books').then((response) => {
    //         const newData = update(books, {$push:[response.data]})
    //         setBooks(newData)
    //     }).catch((data) => {
    //         console.log(data)
    //     })
    // })

    let createBook = (book) => {
        axios.post('http://localhost:3001/books' )
            .then((response) => {
                const newData = update(books, {$push:[response.data]})
                setBooks(newData)
            })
            .catch((data) =>{
                console.log(data)
            })
    }

    return (
        <div className="app-main">
            <FormContainer createBook = {createBook}/>
            <BooksContainer bookData={books}/>
        </div>
    )
};

export default MainContainer;
