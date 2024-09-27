import { useState } from 'react'
import './App.css'

function InputButton({value, onClick, className}) {
  return <button className={className} value={value} onClick={onClick}>{value}</button>
}


export default function App() {
  const [input, setInput] = useState('')

  function handleClick(e) {
    setInput(input + e.target.value)
  }

  function clearInput(_) {
    setInput('')
  }

  function calculate(_) {
    try {
      const result = eval(input).toString()
      setInput(result)
    } catch (error) {
      setInput('Error')
    }
  }

  
  return (
    <div className="calculator">
      <div className='display'>{input}</div>
      <div className='buttons'>
      <InputButton value={'1'} onClick={handleClick}/>
      <InputButton value={'2'} onClick={handleClick}/>
      <InputButton value={'3'} onClick={handleClick}/>
      <InputButton value={'C'} onClick={clearInput} className="clear-btn"/>

      <InputButton value={'4'} onClick={handleClick}/>
      <InputButton value={'5'} onClick={handleClick}/>
      <InputButton value={'6'} onClick={handleClick}/>
      <InputButton value={'+'} onClick={handleClick} className="operator-btn"/>

      <InputButton value={'7'} onClick={handleClick}/>
      <InputButton value={'8'} onClick={handleClick}/>
      <InputButton value={'9'} onClick={handleClick}/>
      <InputButton value={'-'} onClick={handleClick} className="operator-btn"/>

      <InputButton value={'/'} onClick={handleClick} className="operator-btn"/>
      <InputButton value={'0'} onClick={handleClick}/>
      <InputButton value={'*'} onClick={handleClick} className="operator-btn"/>
      <InputButton value={'='} onClick={calculate} className="calculate-btn"/>


      </div>
    </div>
  )
}