function addANewPokemon(event) {
  console.log('TESTE');
  const trainerId = event.target.dataset.trainerId;
  data = { trainer_id: trainerId}

  fetch(POKEMONS_URL, {
    method: 'POST',
    headers:  {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(data)
  })
};