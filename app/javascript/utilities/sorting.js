document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/en-US/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
  }

  if (this.querySelector('.bi-arrow-up-square-fill').classList.contains('hide')) {
      sortedRows.sort(compareRowsAsc)
      this.querySelector('.bi-arrow-up-square-fill').classList.remove('hide')
      this.querySelector('.bi-arrow-down-square-fill').classList.add('hide')
  } else {
      sortedRows.sort(compareRowsDesc)
      this.querySelector('.bi-arrow-down-square-fill').classList.remove('hide')
      this.querySelector('.bi-arrow-up-square-fill').classList.add('hide')
  }

  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table', 'table-striped')

  var tableThead = sortedTable.createTHead()
  tableThead.classList.add('thead-dark')

  sortedTable.appendChild(tableThead).appendChild(rows[0])

  var tableTBody = document.createElement('tbody')
  tableTBody = sortedTable.appendChild(tableTBody)

  for (var i = 0; i < sortedRows.length; i++) {
      tableTBody.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 > testTitle2) { return -1 }
  if (testTitle1 < testTitle2) { return 1 }
  return 0
}