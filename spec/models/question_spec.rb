require 'spec_helper'

describe Question do
  it 'should give us a random question' do    
    question_one = Question.create!(body: "The Eiffel Tower is in Paris. (T/F)", answer: true)
    question_two = Question.create!(body: "The Eiffel Tower is not in Paris. (T/F)", answer: false)
    expect(Question).to receive(:order).with('RANDOM()').and_return([question_one, question_two])
    random = Question.randomize
    expect(random.body).to eq(question_one.body)
  end
end
