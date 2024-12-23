var progressBar = document.querySelector('.ProgressBar')

if (progressBar) {
    var barPercent = progressBar.dataset.barPercent
   
    progressBar.style.width = barPercent  + "%" ;
    progressBar.innerHTML = barPercent  + "%";

  
}