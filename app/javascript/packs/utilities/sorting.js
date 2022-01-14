document.addEventListener('turbolinks:load', function () {
    let sortAscButton = document.getElementById('sortAsc')
    let sortDescButton = document.getElementById('sortDesc')
    if (sortAscButton) { sortAscButton.addEventListener('click', sortByTitleAsc); }
    if (sortDescButton) { sortDescButton.addEventListener('click', sortByTitleDesc); }
})

// пробовал во избежание дублирования кода передавать в функцию параметр, но если в строках 1-2 написать хотя бы скобки,
// то функции сразу выполняются. Аналогичная история с передачей какого-либо параметра, поэтому написал 2 почти одинаковые функции.
// Метод из скринкаста не использован, ибо в нем сортировка идет по нажатии на поле title таблицы, а у меня через кнопки у dropdown.

function sortByTitleAsc() {
    let all_cards = document.querySelectorAll('.card');
    let sorted_cards = [];

    for (let i = 0; i < all_cards.length; i++) {
        sorted_cards.push(all_cards[i]);
    }

    sorted_cards.sort(compareCardsAsc);

    let sortedBlock = document.createElement('div');
    sortedBlock.classList.add('mb-4');
    sortedBlock.id = 'available-tests';

    for (let i = 0; i < sorted_cards.length; i++) {
        sortedBlock.appendChild(sorted_cards[i]);
    }

    document.getElementById('available-tests').replaceWith(sortedBlock);``
}

function sortByTitleDesc() {
    let all_cards = document.querySelectorAll('.card');
    let sorted_cards = [];

    for (let i = 0; i < all_cards.length; i++) {
        sorted_cards.push(all_cards[i]);
    }

    sorted_cards.sort(compareCardsDesc);

    let sortedBlock = document.createElement('div');
    sortedBlock.classList.add('mb-4');
    sortedBlock.id = 'available-tests';

    for (let i = 0; i < sorted_cards.length; i++) {
        sortedBlock.appendChild(sorted_cards[i]);
    }

    document.getElementById('available-tests').replaceWith(sortedBlock);
}

function compareCardsAsc(card_1, card_2) {
    let testTitle1 = card_1.querySelector('.card-title').textContent;
    let testTitle2 = card_2.querySelector('.card-title').textContent;

    if (testTitle1 < testTitle2) { return -1; }
    if (testTitle1 > testTitle2) { return 1; }
    return 0;
}

function compareCardsDesc(card_1, card_2) {
    let testTitle1 = card_1.querySelector('.card-title').textContent
    let testTitle2 = card_2.querySelector('.card-title').textContent

    if (testTitle1 < testTitle2) { return 1; }
    if (testTitle1 > testTitle2) { return -1; }
    return 0;
}