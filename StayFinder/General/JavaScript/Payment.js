function selectPayment(method) {
          const boxes = ['upi', 'card', 'netbanking', 'wallet'];
    boxes.forEach(m => {
        document.getElementById(m + '-box').classList.remove('active');
});
document.getElementById(method + '-box').classList.add('active');
            const options = document.querySelectorAll('.payment-option');
options.forEach(opt => opt.classList.remove('selected'));
            const selectedOption = event.currentTarget;
selectedOption.classList.add('selected');
}
   