
    function makePayment(ID, PropertyId) {
        var options = {
            "key": "rzp_test_abc123xyz", // Replace with your Razorpay Test Key
            "amount": 10000, // in paise = ₹100.00
            "currency": "INR",
            "name": "StayFinder Payment",
            "description": "Payment for " + propertyName,
            "handler": function (response) {
                // On successful payment
                fetch('Home.aspx/RecordPayment', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    body: JSON.stringify({
                        paymentId: response.razorpay_payment_id,
                        requestId: requestId
                    })
                })
                .then(res => res.json())
               .then(data => {
                   if (data.d === "success") {
        alert("Payment successful!");
                location.reload();
            } else if (data.d === "not_found") {
                alert("Request ID not found.");
            } else if (data.d === "update_failed") {
                alert("Payment matched, but update failed.");
            } else {
        alert("Payment record failed.");
    }
});
},
"theme": {
    "color": "#007bff"
}
};
var rzp = new Razorpay(options);
rzp.open();
}

