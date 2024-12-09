document.addEventListener('turbolinks:load', function() { 
    $('.test-title').on('click', formInlineLinkHandler)
    $('.test-cancel').on('click', formButtonCancel)
  
    var errors = document.querySelector('.resource-errors')
  
    if (errors) {
      var resourceId = errors.dataset.resourceId
      formInlineHandler(resourceId)
    }
  })
  function formButtonCancel(event) {
   
    var testId = this.closest('.form-inline').dataset.testId
    formInlineHandler(testId)
  }
  function formInlineLinkHandler(event) {
 
    var testId = this.dataset.testId
    formInlineHandler(testId)
  }
  
  function formInlineHandler(testId) {

    var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]')
  
    $formInline.toggle()
    $testTitle.toggle()
   
}

