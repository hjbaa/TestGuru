document.addEventListener('turbolinks:load', function () {
    let bar = document.getElementById('myBar');
    if (!bar) { return; }

    // удаляем все символы \n
    let temp = document.getElementById('question-counter').textContent.replace(/(\r\n|\n|\r)/gm, "");
    temp = temp.split(' ');

    // преобразовываем каждый элемент полученного массива к number. Number('') === 0, поэтому такие элементы пропускаем.
    for (let i = 0; i < temp.length; i++) {
        if (temp[i] === '') {
            continue;
        }
        temp[i] = Number(temp[i]);
    }
    let questionNumberArray = [];

    // пушим в массив только числовые значения. typeof(NaN) === 'number', поэтому NaN мы не должны учитывать
    for (let i = 0; i < temp.length; i++) {
        if (!isNaN(temp[i]) && typeof(temp[i]) === 'number') {
            questionNumberArray.push(temp[i]);
        }
    }

    let currentQuestion = questionNumberArray[0], totalQuestions = questionNumberArray[1];
    bar.style.width = (currentQuestion - 1) * 100 / totalQuestions + "%";
    bar.textContent = bar.style.width;

})