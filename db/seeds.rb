#countries
[
  TriviaQuestion.create(question: "Which is the only American state to begin with the letter 'p'?", correct_answer: "Pennsylvania"),
  TriviaQuestion.create(question: "What is the world's longest river?", correct_answer: "Amazon"),
  TriviaQuestion.create(question: "Name the world's largest ocean.", correct_answer: "Pacific"),
  TriviaQuestion.create(question: "What is the diameter of Earth?", correct_answer: "8,000 miles"),
  TriviaQuestion.create(question: "Where would you find the world's most ancient forest?", correct_answer: "Daintree Forest north of Cairns, Australia"),
  TriviaQuestion.create(question: "Which four British cities have underground rail systems?", correct_answer: "Liverpool, Glasgow, Newcastle and London"),
  TriviaQuestion.create(question: "What is the capital city of Spain?", correct_answer: "Madrid"),
  TriviaQuestion.create(question: "Which country is Prague in?", correct_answer: "Czech Republic"),
  TriviaQuestion.create(question: "Which English town was a forerunner of the Parks Movement and the first city in Europe to have a street tram system?", correct_answer: "Birkenhead"),
].each do |it|
  it.tag_list = "countries, global, map"
end

# sports
[
  TriviaQuestion.create(question: "What colour jersey is worn by the winners of each stage of the Tour De France?", correct_answer: "Yellow"),
  TriviaQuestion.create(question: "Name the only heavyweight boxing champion to finish his career of 49 fights without ever having been defeated?", correct_answer: "Rocky Marciano"),
  TriviaQuestion.create(question: "Which sport does Constantino Rocca play?", correct_answer: "Golf"),
  TriviaQuestion.create(question: "How many times was the Men's Tennis Singles at Wimbledon won by Bjorn Borg?", correct_answer: "Five"),
  TriviaQuestion.create(question: "In 2011, which country hosted a Formula 1 race for the first time?", correct_answer: "India"),
  TriviaQuestion.create(question: "Name the game played on a lawn called a 'crown green'", correct_answer: "Bowls"),
  TriviaQuestion.create(question: "Which chess piece can only move diagonally?", correct_answer: "A bishop"),
  TriviaQuestion.create(question: "Name the only footballer to have played for Liverpool, Everton, Manchester City and Manchester United", correct_answer:"Peter Beardsley"),
  TriviaQuestion.create(question: "In football, who was nicknamed 'The Divine Ponytail'?", correct_answer: "Roberto Baggio"),
].each do |it|
  it.tag_list = "sports"
end

# food
[
  TriviaQuestion.create(question: "If you had Lafite-Rothschild on your dinner table, what would it be?", correct_answer: "Wine"),
  TriviaQuestion.create(question: "What is sushi traditionally wrapped in?", correct_answer: "Edible seaweed"),
  TriviaQuestion.create(question: "May Queen, Wisley Crab, Foxwhelps and Lane's Prince Albert are all species of what?", correct_answer: "Apples"),
  TriviaQuestion.create(question: "What is allspice alternatively known as?", correct_answer: "Pimento"),
  TriviaQuestion.create(question: "What colour is Absynthe?", correct_answer: "Green"),
  TriviaQuestion.create(question: "What flavour is Cointreau?", correct_answer: "Orange"),
  TriviaQuestion.create(question: "If you were to cut a hare into pieces, marinate it in wine and juniper berries then stew this slowly in a sealed container, what would this recipe be called?", correct_answer: "Jugged hare"),
  TriviaQuestion.create(question: "Fried tarantulas, eggs boiled just before they're due to hatch, live octopus, and puffin hearts eaten raw when still-warm are all traditional foods—true or false?", correct_answer: "True"),
  TriviaQuestion.create(question: "How many crocus flowers does it take to make a pound of saffron?", correct_answer: "Up to 75,000 flowers, which is enough to fill an entire football pitch"),
  TriviaQuestion.create(question: "Costing around $2,600 per pound and made only to order by Knipschildt, what is the name of this chocolate truffle?", correct_answer: "Chocopologie"),
].each do |it|
  it.tag_list = "food"
end
