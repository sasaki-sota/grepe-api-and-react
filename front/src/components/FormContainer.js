import React, {useState} from "react";
import {Button, FormGroup, FormControl} from 'react-bootstrap'

const FormContainer = (props) => {
    const [book, setBook] = useState('');

    const onChangeText = event => {
        setBook(event.target.value)
    }

    const submitHandler = () => {
        props.createBook(book)
        setBook('')
    }

    return(
        <React.Fragment>
            <FormGroup controlId="formBasicText">
                <FormControl
                    type="text"
                    value={book}
                    placeholder="Enter text"
                    onChange={e => onChangeText(e)}
                />
            </FormGroup>

            <Button type="submit" onClick={submitHandler}>つぶやく</Button>
        </React.Fragment>
    )
}

export default FormContainer;
